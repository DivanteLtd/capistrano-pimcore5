require 'capistrano/composer'

SSHKit.config.command_map[:pimcore] = '/usr/bin/env php -f bin/console --'

module Capistrano
  module Pimcore5
    # Pimcore Helpers
    module Helpers
      def pimcore_environment
        ENV['env'] || fetch(:env)
      end
    end
  end
end

load File.expand_path('../tasks/pimcore5.rake', __FILE__)

# Core tasks for deploying pimcore
load File.expand_path('../tasks/deploy.rake', __FILE__)

namespace :load do
  task :defaults do
    load 'capistrano/pimcore5/defaults.rb'
  end
end
