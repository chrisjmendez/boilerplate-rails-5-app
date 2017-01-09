namespace :db do
  desc %Q{ ›› Drop the db schema, Create a new DB, Migrate the DB, Populate the DB. (Development-mode Only) }
  task wipe: :environment do
    # Safe guard #1
    raise 'You cannot run this in production' if Rails.env.production?
    # 'skip_prod' is Safe guard #2
    [ 'skip_prod', 'db:purge', 'db:create', 'db:migrate', 'db:seed' ]
  end
end 