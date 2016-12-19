namespace :benchmark do
  desc %Q{ ›› Benchmark the performance with 500 requests }
  task small: :environment do
    host        = Rails.env.production? ? ENV['HEROKU_URL'] : "http://localhost:3000"
    path        = "keywords/"
    requests    = 500
    connections = 5
    sh %{ ab -n #{requests} -c #{connections} -l #{host}/#{path} }
  end

  desc %Q{ ›› Benchmark the performance with 1000 requests }
  task medium: :environment do
    sh %{ ab -n 1000 -c 5 -l http://localhost:3000/keywords }
  end

  desc %Q{ ›› Benchmark the performance with 5000 requests }
  task big: :environment do
    sh %{ ab -n 5000 -c 5 -l http://localhost:3000/keywords }
  end

end
