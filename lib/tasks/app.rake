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

  # Configuring gems
  task step_four: :environment do
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
    sh %{ rails g devise:views }
          
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


  # ## ## ## ## ## ## ## ## ## ## ## ## ## 
  # Domain Specific App Logic
  # ## ## ## ## ## ## ## ## ## ## ## ## ## 
  
  # Create a Location Model that parses zip code data from a CSV file
  sh %{ rails g model Location zip_code:integer zip_code_type:string city:string state:string lat:float lng:float country:string location_text:string location:string estimated_population:integer total_wages:decimal }
  
  
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
