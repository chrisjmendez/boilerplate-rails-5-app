namespace :gemfile do
  
  desc %Q{ ›› Remove all the comments in Gemfile and make a Gemfile.bak just in case }
  task :clean do
    sh %{ ruby -pi.bak -pe "gsub(/^#.*\n/, '')" Gemfile }
  end
  
end