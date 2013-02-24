require './app'
require 'rack/test'
require 'turn/autorun'

set :environment, :test

module ApiHelper
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
end

include ApiHelper
