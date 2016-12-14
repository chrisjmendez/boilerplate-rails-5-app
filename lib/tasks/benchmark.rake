namespace :benchmark do
  desc %Q{ ›› Benchmark the performance with 500 requests }
  task small: :environment do
    sh %{ ab -n 500 -c 5 -l http://localhost:3000/keywords }
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
