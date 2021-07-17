max_threads = ENV.fetch('RACK_MAX_THREADS') { 5 }
min_threads = ENV.fetch('RACK_MIN_THREADS') { max_threads }

pidfile ENV.fetch('PIDFILE') { 'tmp/pids/puma.pid' }
workers ENV.fetch('WORKERS') { 2 }

environment ENV.fetch('RACK_ENV') { 'development' }
port ENV.fetch('PORT') { 3000 }

threads min_threads, max_threads
plugin :tmp_restart

preload_app!
