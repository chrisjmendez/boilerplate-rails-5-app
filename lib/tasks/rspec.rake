namespace :rspec do
  desc "›› Rspec run all specs"
  task all: :environment do
    sh %{ bundle exec rspec }
  end

  desc "›› Rspec run only model specs"
  task model: :environment do
    sh %{ bundle exec rspec spec/models }
  end

  desc "›› Rspec run only controller specs"
  task controller: :environment do
    sh %{ bundle exec rspec spec/controllers }
  end
end
