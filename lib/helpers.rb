module Sinatra
  module Helpers
    def partial(template, *args)
      template_array = template.to_s.split('/')
      template = template_array[0..-2].join('/') + "/_#{template_array[-1]}"
      options = args.last.is_a?(Hash) ? args.pop : {}
      options.merge!(layout: false)
      locals = options[:locals].nil? ? {} : options[:locals] # SAVE LOCALS
      if collection = options.delete(:collection) then
        collection.inject([]) do |buffer, member|
          buffer << haml(:"#{template}", options.merge(
            layout: false, locals: {template_array[-1].to_sym => member}.merge(locals))) # MERGE THEM BACK TO EACH
        end.join("\n")
      else
        haml(:"#{template}", options)
      end
    end

    def current_env
      ENV['RACK_ENV']
    end

    def host
      if current_env == 'production'
        'http://www.mrmil.cz'
      else
        'http://127.0.0.1:9393'
      end
    end

    def time_rss(time)
      time.strftime("%a, %d %b %Y %H:%M:%S %z");
    end

    def title(title)
      @title = title
    end

    def head_title(title)
      suffix = I18n.t('mrmil')
      return suffix if request.path == '/'
      "#{ title } – #{ suffix }"
    end

    def with_host(path)
      "#{ host }#{ path }"
    end
  end
end
