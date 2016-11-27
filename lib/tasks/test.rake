namespace :test do
  desc "›› Rspec drop test database"
  task drop: :environment do
    sh %{ bundle exec rails db:drop RAILS_ENV=test }
  end

  desc "›› Rspec create test database"
  task create: :environment do
    sh %{ bundle exec rails db:create RAILS_ENV=test }
  end

  desc "›› Rspec load test database"
  task load: :environment do
    sh %{ bundle exec rails db:schema:load RAILS_ENV=test }
  end
  
  desc "›› Rspec wipe test database"
  task wipe: :environment do
    sh %{ bundle exec rails db:purge db:create db:schema:load RAILS_ENV=test }
  end
end
