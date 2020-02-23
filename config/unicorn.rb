APP_PATH = "/root/nagaoka"

worker_processes 2

#working_directory "~/nagaoka/rss"

listen 3000

#pid APP_PATH + "/tmp/pids/unicorn.pid"
pid  "/tmp/nagaoka_unicorn.pid"
#stderr_path APP_PATH + "/log/nagaoka_unicorn.log"
stderr_path "/tmp/nagaoka_unicorn.log"
#stdout_path APP_PATH + "/log/nagaoka_unicorn.log"
stdout_path "/tmp/nagaoka_unicorn.log"


preload_app true

