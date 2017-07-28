include Capistrano::Pimcore5::Helpers

namespace :deploy do
  task :updated do
    invoke 'pimcore:deployment:classes-rebuild'
  end
end
