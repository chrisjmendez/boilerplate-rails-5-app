namespace :guard do
  desc "›› Start Guard "
  task start: :environment do
    sh %{ guard }
  end
  task test: :environment do
    sh %{ guard }
  end
end
