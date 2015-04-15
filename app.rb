require 'bundler'
Bundler.require

require './config/environment'

before do
  I18n.config.enforce_available_locales = false
  I18n.locale = :cs
  I18n.load_path += Dir['./config/locales/**/*.{rb,yml}']
end

get '/' do
  @articles = Article.all(date: :desc)
  haml :articles
end

get '/stranky/:path' do |path|
  begin
    @article = Article.find_by_path(path)
    haml :article
  rescue ArticleNotFoundError
    status 404
    haml :page404
  end
end

get '/stranky.rss' do
  @articles = Article.all(date: :desc)
  builder :articles
end

get '/stranky' do
  redirect '/', 301
end

get '/stitky*' do
  redirect '/', 301
end
