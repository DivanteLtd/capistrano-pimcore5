include Capistrano::Pimcore5::Helpers

namespace :deploy do
  task :updated do
    invoke 'pimcore:deployment:classes-rebuild' if fetch(:pimcore_deploy_classes_rebuild)
    invoke 'pimcore:cache:clear'
  end
end
