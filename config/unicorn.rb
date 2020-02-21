APP_PATH = "/var/www/ruby/rss"

worker_processes 2

working_directory "/var/www/ruby/rss"

listen 3000

pid APP_PATH + "/tmp/pids/unicorn.pid"
stderr_path APP_PATH + "/log/unicorn.log"
stdout_path APP_PATH + "/log/unicorn.log"


preload_app true

