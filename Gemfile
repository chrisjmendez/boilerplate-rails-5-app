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



# ### ### ### ### ### ### ### ###
# Development
# ### ### ### ### ### ### ### ###

# Better Error Reporting
# https://github.com/charliesome/better_errors
gem "better_errors", group: [:development]
# Evaluate errors with context
# https://github.com/banister/binding_of_caller
gem "binding_of_caller", group: [:development]



# ### ### ### ### ### ### ### ###
# Benchmarking 
# https://github.com/schneems/derailed_benchmarks#dynamic-app-benchmarking
# ### ### ### ### ### ### ### ###

# Bench mark your app
# https://github.com/schneems/derailed_benchmarks
# http://www.schneems.com/2015/05/11/how-ruby-uses-memory.html
gem 'derailed_benchmarks', group: [:development]
gem 'stackprof', group: [:development]
# Monitor the health and performance of your app 
# https://github.com/newrelic/rpm
# Config: config/newrelic.yml
# Usage: Heroku Production
gem 'newrelic_rpm', groups: [:production]



# ### ### ### ### ### ### ### ###
# Authentication
# ### ### ### ### ### ### ### ###

# You may need to request from the source for Rails 5
# https://github.com/plataformatec/devise
# Config: config/environments/development.rb
# Config: config/initializers/devise.rb
gem 'devise', '~> 4.2.0'
# https://github.com/cowboyd/therubyracer
gem "therubyracer"
# https://github.com/omniauth/omniauth
# gem 'omniauth'
# Facebook OmniAuth Strategy https://github.com/mkdynamic/omniauth-facebook
# gem 'omniauth-facebook'
# https://github.com/arunagw/omniauth-twitter
# gem 'omniauth-twitter'
# https://github.com/skorks/omniauth-linkedin
# gem 'omniauth-linkedin'
# https://github.com/intridea/omniauth-github
#gem 'omniauth-github'



# ### ### ### ### ### ### ### ###
# Configuration
# ### ### ### ### ### ### ### ###

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
# This outputs JSON
# http://www.chrisjmendez.com/2016/07/04/rails-5-api-only-app/
# Config: config/initializers/active_model_serializers.rb
gem 'active_model_serializers'
# Store environmental variables away from git
# https://github.com/bkeepers/dotenv
gem 'dotenv-rails', groups: [:development, :test]
# Server Watcher 
# https://github.com/alexch/rerun
gem 'rerun', groups: [:development, :test]
# Pagination
# https://github.com/kaminari/kaminari
gem 'kaminari'
# PrismJS.com for syntax highlighting
# https://github.com/PrismJS/prism
gem "prism-rails"



# ### ### ### ### ### ### ### ###
# Testing
# ### ### ### ### ### ### ### ###

# Populate db/seeds.rb with fake data
# https://github.com/stympy/faker
gem 'faker'
# Hash a password
# https://github.com/codahale/bcrypt-ruby
gem 'bcrypt'
# Programmatic testing using Rspec
# https://github.com/rspec/rspec-rails
gem 'rspec-rails', groups: [:development, :test]
# Automatically run tests through Rspec
# https://github.com/guard/guard-rspec
gem 'guard-rspec', require: false, groups: [:development, :test]
gem 'spring-commands-rspec', groups: [:development, :test]
# Real-time Rspec testing
# https://github.com/guard/guard-livereload
# Config: /Guardfile
gem 'guard-livereload', require: false, groups: [:development]
# Auto refresh the browser w/o a Chrome plug-in
# https://github.com/johnbintz/rack-livereload
# Config: config/environments/development.rb
gem "rack-livereload", group: [:development]

# Factory Girl for fixture replatement
# https://github.com/thoughtbot/factory_girl_rails
gem 'factory_girl_rails', groups: [:development, :test]
# Capybara for automated testing (w/o cucumber)
# https://github.com/teamcapybara/capybara
gem 'capybara', groups: [:test]



# ### ### ### ### ### ### ### ###
# Views
# ### ### ### ### ### ### ### ###

# Simplified Forms
# https://github.com/plataformatec/simple_form
gem 'simple_form', '~> 3.2', '>= 3.2.1'
# HAML templating engine
# https://github.com/indirect/haml-rails
gem 'haml-rails', '~> 0.9.0'
# Bootstrap templates 
# https://github.com/twbs/bootstrap-rubygem
#gem 'bootstrap', '~> 4.0.0.alpha5'
# https://github.com/twbs/bootstrap-sass
gem 'bootstrap-sass', '~> 3.3.6'
# Easily include static pages 
# https://github.com/thoughtbot/high_voltage
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end
# Easily include static pages 
# https://github.com/thoughtbot/high_voltage
gem 'high_voltage'
# Convert existing .erb to .haml
# https://github.com/dhl/erb2haml
gem 'erb2haml', groups: [:development]
# Font Awesome SASS
# https://github.com/FortAwesome/font-awesome-sass
gem 'font-awesome-sass'



# ### ### ### ### ### ### ### ###
# Logging
# ### ### ### ### ### ### ### ###

# Simple colored logging for Rails apps
# https://github.com/phallguy/shog
gem 'shog', groups: [:development, :test]
# Advanced Logging
# https://github.com/dwbutler/logstash-logger
# gem 'logstasher', groups: [:development, :test]




# ### ### ### ### ### ### ### ###
# Performance
# ### ### ### ### ### ### ### ###

# Used with Active Job for asynchronous messaging
# https://github.com/brandonhilkert/sucker_punch
gem 'sucker_punch', '~> 2.0'
# Memcache for caching pages and fragments
# https://github.com/petergoldstein/dalli
# Usage: Heroku Production
# Config: config/environments/production.rb
gem 'dalli', groups: [:production]


# ### ### ### ### ### ### ### ###
# App Specific Gems
# ### ### ### ### ### ### ### ###


