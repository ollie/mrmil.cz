source 'https://rubygems.org'

gem 'rake'
gem 'haml', '~> 5' # Templating
gem 'ostruct'
gem 'rdiscount' # Markdown
gem 'i18n'      # Locales
gem 'builder'   # RSS

# Lib dependencies
gem 'sinatra'  # Web framework

group :development do
  gem 'puma', require: false
  # gem 'pry'        # Debugging
  # gem 'pry-doc'
  gem 'compass'    # SCSS

  # rbenv integration for Capistrano.
  gem 'capistrano-rbenv', require: false

  # Bundler support for Capistrano 3.x.
  gem 'capistrano-bundler', require: false

  # Passenger support for Capistrano 3.x.
  gem 'capistrano-passenger', require: false

  gem 'ed25519', require: false      # Required for Capistrano to work with ed25519 key.
  gem 'bcrypt_pbkdf', require: false # Required for Capistrano to work with ed25519 key.
end

group :test do
  gem 'rack-test'
  gem 'minitest', '~> 4' # Testing
  gem 'turn'     # Better test output
end
