require 'capistrano/recipes/deploy/scm/git'

module Capistrano::Deploy::SCM
  class GitMod < Git
    default_command "git"
    
    def checkout(revision, destination)
      git    = command
      remote = origin

      args = []
      args << "-o #{remote}" unless remote == 'origin'
      if depth = variable(:git_shallow_clone)
        args << "--depth #{depth}"
      end

      execute = []
      if args.empty?
        execute << "#{git} clone #{verbose} #{variable(:repository)} #{destination}"
      else
        execute << "#{git} clone #{verbose} #{args.join(' ')} #{variable(:repository)} #{destination}"
      end

      # checkout into a local branch rather than a detached HEAD
      execute << "cd #{destination} && #{git} checkout #{verbose} -b deploy #{revision}"
      
      if variable(:git_enable_submodules)
        execute << "#{update_submodules}"
      end

      execute.join(" && ")
    end
    
    def sync(revision, destination)
      git     = command
      remote  = origin

      execute = []
      execute << "cd #{destination}"

      # Use git-config to setup a remote tracking branches. Could use
      # git-remote but it complains when a remote of the same name already
      # exists, git-config will just silenty overwrite the setting every
      # time. This could cause wierd-ness in the remote cache if the url
      # changes between calls, but as long as the repositories are all
      # based from each other it should still work fine.
      if remote != 'origin'
        execute << "#{git} config remote.#{remote}.url #{variable(:repository)}"
        execute << "#{git} config remote.#{remote}.fetch +refs/heads/*:refs/remotes/#{remote}/*"
      end

      # since we're in a local branch already, just reset to specified revision rather than merge
      execute << "#{git} fetch #{verbose} #{remote} && #{git} reset #{verbose} --hard #{revision}"

      if variable(:git_enable_submodules)
        execute << "#{update_submodules}"
      end

      # Make sure there's nothing else lying around in the repository (for
      # example, a submodule that has subsequently been removed).
      execute << "#{git} clean #{verbose} -d -x -f"

      execute.join(" && ")
    end
  
  private
    def update_submodules
      "git submodule update --init --recursive"
    end
  end
end
