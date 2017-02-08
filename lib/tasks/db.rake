## ## ## ## ## ## ## ## ## ## ## ## ## ## ##
# Backing up your data
# Features:
# - Support for 4 types of postgres dumps with suffixes
# - Uses the correct format according to the suffix of the file on the restore
# - db:list task will show the current dumps.
# - db:restore to match any pattern (not just the date). This allows you to transfer on db to another by setting RAILS_ENV
# - Detects when pattern matches no files or too many files.
# - Automatically creates the backup directory db/backups if needed
# Source:
#   https://gist.github.com/hopsoft/56ba6f55fe48ad7f8b90
#
namespace :db do
  
  desc %Q{ ›› Drop the db schema, Create a new DB, Migrate the DB, Populate the DB. (Development-mode Only) }
  task wipe: :environment do
    # Safe guard #1
    raise 'You cannot run this in production' if Rails.env.production?
    # 'skip_prod' is Safe guard #2
    [ 'skip_prod', 'db:purge', 'db:create', 'db:migrate', 'db:seed' ]
  end

  desc "Dumps the database to backups"
  task dump: :environment do
    dump_fmt = 'c'      # or 'p', 't', 'd'
    dump_sfx = suffix_for_format dump_fmt
    backup_dir = backup_directory true
    cmd = nil
    with_config do |app, host, db, user|
      file_name = Time.now.strftime("%Y%m%d%H%M%S") + "_" + db + '.' + dump_sfx
      cmd = %{ pg_dump -F #{dump_fmt} -h #{host} -d #{db} -f #{backup_dir}/#{file_name} -v }
    end
    puts cmd
    exec cmd
  end


  desc "Show the existing database backups"
  task list: :environment do
    backup_dir = backup_directory
    puts "#{backup_dir}"
    exec "/bin/ls -lt #{backup_dir}"
  end


  desc "Restores the database from a backup using PATTERN"
  task :restore, [:pat] => :environment do |task,args|
    if args.pat.present?
      cmd = nil
      with_config do |app, host, db, user|
        backup_dir = backup_directory
        files = Dir.glob("#{backup_dir}/*#{args.pat}*")
        case files.size
        when 0
          puts "No backups found for the pattern '#{args.pat}'"
        when 1
          file = files.first
          fmt = format_for_file file
          if fmt.nil?
            puts "No recognized dump file suffix: #{file}"
          else
            cmd = "pg_restore -F #{fmt} -v -c -C #{file}"
          end
        else
          puts "Too many files match the pattern '#{args.pat}':"
          puts ' ' + files.join("\n ")
          puts "Try a more specific pattern"
        end
      end
      unless cmd.nil?
        Rake::Task["db:drop"].invoke
        Rake::Task["db:create"].invoke
        puts cmd
        exec cmd
      end
    else
      puts 'Please pass a pattern to the task'
    end
  end

  private

  def suffix_for_format suffix
    case suffix
    when 'c' then 'dump'
    when 'p' then 'sql'
    when 't' then 'tar'
    when 'd' then 'dir'
    else nil
    end
  end

  def format_for_file file
    case file
    when /\.dump$/ then 'c'
    when /\.sql$/  then 'p'
    when /\.dir$/  then 'd'
    when /\.tar$/  then 't'
    else nil
    end
  end

  def backup_directory create=false
    backup_dir = File.join("db", "backups") 
    #backup_dir = File.join("#{Rails.root}", "db", "backups") 
    if create and not Dir.exists?(backup_dir)
      puts "\n Creating #{backup_dir} ..\n"
      FileUtils.mkdir_p(backup_dir)
    end
    backup_dir
  end

  def with_config
    yield Rails.application.class.parent_name.underscore,
    ActiveRecord::Base.connection_config[:host],
    ActiveRecord::Base.connection_config[:database],
    ActiveRecord::Base.connection_config[:username]
  end

end
