source 'https://rubygems.org'
ruby '2.2.2'

gem 'rake'
gem 'haml'      # Templating
gem 'rdiscount' # Markdown
gem 'i18n'      # Locales
gem 'builder'   # RSS

# Lib dependencies
gem 'sinatra'  # Web framework

group :development do
  gem 'shotgun'    # Reloading
  gem 'pry'        # Debugging
  gem 'compass'    # SCSS

  # rbenv integration for Capistrano.
  gem 'capistrano-rbenv', require: false

  # Passenger support for Capistrano 3.x.
  gem 'capistrano-passenger', require: false
end

group :test do
  gem 'rack-test'
  gem 'minitest', '~> 4' # Testing
  gem 'turn'     # Better test output
end
