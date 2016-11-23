namespace :db do    
  desc %Q{ ›› Drop the db schema, Create a new one, Migrate the data, Populate the data }
  task wipe: :environment do
    sh %{ rails db:purge db:create db:migrate db:seed  }
  end
end 