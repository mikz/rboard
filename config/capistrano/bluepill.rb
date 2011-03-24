before "deploy:update", "bluepill:stop"
after "deploy:update", "bluepill:start"

set :sudo, 'sudo -n'
set :sudo_prompt, ''
set :password, ''

default_run_options[:pty] = true

bluepill = "`which system_bluepill`"

namespace :bluepill do  
  desc "Stop processes that bluepill is monitoring and quit bluepill"
  task :quit, :roles => [:app] do
    sudo "#{bluepill} stop"
    sudo "#{bluepill} quit"
  end
  
  desc "Stop processes that bluepill is monitoring"
  task :stop, :roles => [:app] do
    sudo "#{bluepill} stop; true"
  end
  
  desc "Load bluepill configuration and start it"
  task :start, :roles => [:app] do
    sudo "#{bluepill} load #{File.join(release_path, 'config', 'bluepill', 'production.pill')}"
  end
 
  desc "Prints bluepills monitored processes statuses"
  task :status, :roles => [:app] do
    sudo "#{bluepill} status"
  end
end