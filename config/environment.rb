require 'i18n'
require './lib/eval_script'
require './lib/helpers'
require './lib/article'

set :protection, except: :frame_options # Turn off the X-Frame-Options header to be able to display iframe contents
set :haml, layout: :'layouts/application'

helpers do
  include Sinatra::Helpers
end
