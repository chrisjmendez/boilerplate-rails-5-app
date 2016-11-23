source 'https://rubygems.org'


gem 'rails', '~> 5.0.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]



# #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ###
# COPY GEM'S BELOW
# #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### ###

# ###
# Authentication
# ###
# You may need to request from the source for Rails 5
gem 'devise', git: 'https://github.com/plataformatec/devise.git'  

# ###
# Configuration
# ###

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
# This outputs JSON
# http://www.chrisjmendez.com/2016/07/04/rails-5-api-only-app/
gem 'active_model_serializers'
# Environmental variables
gem 'dotenv-rails', :groups => [:development, :test]
# Server Watcher
gem 'rerun', :groups => [:development, :test]

# ###
# Testing
# ###

# Populate fake test data
gem 'populator', :groups => [:development, :test]
# Populate fake test data
gem 'faker', :groups => [:development, :test]
# You need this to turn a password into a hash
gem 'bcrypt'



# ###
#Views
# ###

# Simplified forms https://github.com/plataformatec/simple_form
gem 'simple_form', '~> 3.2', '>= 3.2.1'
# HAML template engine https://github.com/indirect/haml-rails
gem 'haml-rails', '~> 0.9.0'
# Bootstrap templates https://github.com/twbs/bootstrap-rubygem
gem 'bootstrap', '~> 4.0.0.alpha5'
# Easily include static pages https://github.com/thoughtbot/high_voltage
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end
# Easily include static pages https://github.com/thoughtbot/high_voltage
gem 'high_voltage'
# Convert existing .erb to .haml
gem 'erb2haml', :groups => [:development]
# Font Awesome SASS
gem 'font-awesome-sass'


# ###
#Testing
# ###

# Rspec
gem 'spring-commands-rspec', :groups => [:development, :test]  
gem 'rspec-rails', :groups => [:development, :test]  
# Factory Girl
gem 'factory_girl_rails', :groups => [:development, :test]  
# Capybara
gem 'capybara', :groups => [:test]  
