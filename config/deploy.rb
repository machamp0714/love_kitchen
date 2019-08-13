# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "love_kitchen"
set :repo_url, "git@github.com:machamp0714/love_kitchen.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/projects"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push("config/master.key")

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push("log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system")

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

set :rbenv_ruby, "2.5.3"

set :log_level, :debug

namespace :deploy do
    desc "Restart application"
    task :restart do
        on roles(:app) do
            invoke "unicorn:restart"
        end
    end
    desc "Create database"
    task :db_create do
        on roles(:db) do |host|
            with rails_env: fetch(:rails_env) do
                within current_path do
                    execute :bundle, :exec, :rake, "db:create"
                end
            end
        end
    end

    after :publishing, :restart

    after :restart, :clear_cache do
        on roles(:web), in: :groups, limit: 3, wait: 10 do
        end
    end
end
# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
