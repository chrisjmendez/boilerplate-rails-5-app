namespace :app do

  # ## ## ## ## ## ## ## ## ## ## ## ## ## 
  # Getting Started
  # ## ## ## ## ## ## ## ## ## ## ## ## ## 

  desc "Create a rails app, create some tasks, update Gemfile and install external libraries"
  task step_one: :environment do
    # Create a new rails app
    sh %{ rails _5.0.0_ new my-app --force -d postgresql --skip-bundle }
    # Configure your databases: development, test, and production
    sh %{ Modify 'config/database.yml' }
    # Change directory into the rails app
    sh %{ cd my-app }
    # Create a .gitignore
    sh %{ touch .gitignore }
    # Set up your git ignore
    sh %{ echo "Go to https://www.gitignore.io/api/rails%2Cruby and paste into .gitignore" }
  end
  
  # Explainer: http://www.chrisjmendez.com/2016/07/31/rails-5-tasks/
  task step_two: :environment do
    # Set up Rspec
    sh %{ rails g rspec:install }
    # Spring is a Rails app preloader. It speeds up development by keeping your app running 
    #    in the background so you don't need to boot it every time you run a test, rake task or migration.
    sh %{ bundle exec spring binstub --all }
    # Create macro tasks to speed up the dev process
    sh %{ rails g task app initialize }
    # This will completely wipe the database, create it, update the tables and populate the data
    sh %{ rails g task db wipe }
    # This will help you spin up a server that watches changes to models and controllers
    sh %{ rails g task server start pid kill remove_server setup_logger }
    # Clean up the Gemfile by creating a backup then deleting the comments
    sh %{ rails g task gemfile clean }
    # Adjust your localhost if your within a firewall for mac
    sh %{ rails g task network proxy_off proxy_on configure_bypass_proxy}
  end

  # ## ## ## ## ## ## ## ## ## ## ## ## ## 
  # Managing external gem libraries
  # ## ## ## ## ## ## ## ## ## ## ## ## ## 

  # Installing Gems
  task step_three: :environment do    
    # Copy and paste the Gemfile to your own app
    sh %{ echo "Update your Gemfile to look like ours" }
    # Install all the bundles
    sh %{ bundle install }
    # Create a database
    sh %{ rails db:create }
  end

  # Configuring Simple Form
  task step_four: :environment do
    # Configure HAML, Rspec and Factory Girl => config/application.rb
    sh %{ echo "Look below at insert_into_application, copy and paste to 'config/application.rb'" }

    # Configure Simple Form (https://github.com/plataformatec/simple_form)
    sh %{ rails g simple_form:install --bootstrap }
    
    # Configure Bootstrap
    sh %{ echo "Follow these instructions => https://github.com/twbs/bootstrap-rubygem" }    
  end

  # Configuring Devise
  task step_five: :environment do
    # Configure HAML, Rspec and Factory Girl => config/application.rb
    sh %{ echo "Look below at insert_into_application, copy and paste to 'config/application.rb'" }

    # Configure Simple Form (https://github.com/plataformatec/simple_form)
    sh %{ rails g simple_form:install --bootstrap }
    
    # Configure Bootstrap
    sh %{ echo "Follow these instructions => https://github.com/twbs/bootstrap-rubygem" }
    
    
    # Configure Devise (http://www.chrisjmendez.com/2016/06/23/rails-devise)
    sh %{ rails g devise:install }
    sh %{ rails g devise User }
    sh %{ echo "Follow the instructions on the prompt." }
    sh %{ rails g devise:controllers users }    
    sh %{ rails g devise:views }
    # Adding E-mail confirmation

    # Update Database
    sh %{ rails db:migrate }  
    
    # Create a generic home controller with an index page
    sh %{ rails g controller home index }
    
    # (Optional) Configure Devise to work with Mailgun
    sh %{ echo "Customize Devise some more => http://www.chrisjmendez.com/2016/06/23/rails-devise#customizingdevise" }
    
    # Replace .ERB to .HAML (https://github.com/dhl/erb2haml)
    # You do this after you've created devise:views
    sh %{ rails rake haml:replace_erbs }
  end
  
  # Expanding Devise to include E-mail confirmation 
  # http://www.chrisjmendez.com/2016/06/23/rails-devise#emailconfirmation
  # https://github.com/plataformatec/devise/wiki/How-To:-Add-:confirmable-to-Users
  task step_five: :environment do
    sh %{ echo "add :confirmable" to models/user.rb }
    sh %{ echo "Remove commentes from /db/migrate/YYYYMMDDxxx_devise_create_users.rb" }
    sh %{ rails g migration add_confirmable_to_devise 
      unconfirmed_email:string 
      confirmation_token:token:unique:index
      confirmed_at:datetime 
      confirmation_sent_at:datetime 
      password_reset_token:token   
    }
    sh %{  }    
  end

  # Convert all .erb files to .haml
  # We're doing this after Devise so that we can modify those views too
  task step_six: :environment do
    # Replace .ERB to .HAML (https://github.com/dhl/erb2haml)
    # You do this after you've created devise:views
    sh %{ rails rake haml:replace_erbs }
  end
  

  # ## ## ## ## ## ## ## ## ## ## ## ## ## 
  # Domain Specific App Logic
  # ## ## ## ## ## ## ## ## ## ## ## ## ## 
  
  task app_logic: :environment do
    # Create a Location Model that parses zip code data from a CSV file
    sh %{ rails g model Location zip_code:integer zip_code_type:string city:string state:string lat:float lng:float country:string location_text:string location:string estimated_population:integer total_wages:decimal }
  end
  
  # ## ## ## ## ## ## ## ## ## ## ## ## ## 
  # Save using Git and Github
  # ## ## ## ## ## ## ## ## ## ## ## ## ## 
    
  # Explainer: 
  task save_to_local_git: :environment do 
    # Init Git
    sh %{ git init }
    # Add All files
    sh %{ git add -A }
    # Review changes
    sh %{ git status }
    # Commit changes with a message
    sh %{ git commit -m 'Initial import' }
    # Check the log 
    sh %{ git log  }
  end

  task save_to_github: :environment do 
    # Tell git add Github as the origin for the master branch
    sh %{ git remote add origin git@github.com:[username]/[app_name].git}
    # Pull any data initially created in Github
    sh %{ git pull origin master }
    # Push the local repo to Github (the remote repository)
    sh %{ git push -u origin master  }    
  end

end


# Add this to config/application.rb
def insert_into_application
  #CHANGED
  config.generators do |g|
    # Use Rspec
    g.test_framework  :rspec, fixture: false
    # Use haml
    g.template_engine :haml
    # Use Factory girl
    g.fixture_replacement :factory_girl, dir: 'spec/factories'
  end
end

def add_smtp_to_config
  #CHANGED
  #config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.action_mailer.delivery_method = :smtp  
  config.action_mailer.perform_deliveries = true  
  config.action_mailer.raise_delivery_errors = true  
  config.action_mailer.smtp_settings = {  
       :address => "smtp.mailgun.org",
       #:port => 587,
       :domain => "mydomain.com",
       :user_name => "my_username",
       :password => "S0M3P@Sswd",
       :authentication => 'plain',
       :enable_starttls_auto => true
  }
end
