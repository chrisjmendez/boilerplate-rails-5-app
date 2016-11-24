# Passing arguments to Rake Tasks
# http://cobwwweb.com/4-ways-to-pass-arguments-to-a-rake-task
# Creating a Contab using Rake
# http://tutorials.jumpstartlab.com/topics/systems/automation.html

namespace :server do  
  desc %Q{ ›› Run Rails while monitoring /app, /config }
  task :start do
    sh %{ rerun --dir config,app rails s }
  end

  desc %Q{ ›› Get the PID of the server }
  task :pid do
    sh %{ more ./tmp/pids/server.pid }
  end
  
  desc %Q{ ›› Kill -9 [:pid] }
  task :kill, [:pid] do |t, args|
    @pid = args[:pid]
    sh %{ set -e }
    sh %{ kill -9 #{@pid} }
    sh %{ rm -rf ./tmp/pids/server.pid }    
  end
    
  desc %Q{ ›› Remove rails detached server }
  task :remove_server do
    sh %{ ps -aef | grep rails }
  end
  
  desc %Q{ ›› Logger fix http://jerryclinesmith.me/blog/2014/01/16/logging-from-rake-tasks/ }
  task setup_logger: :environment do
    logger           = Logger.new(STDOUT)
    logger.level     = Logger::INFO
    Rails.logger     = logger
  end
end