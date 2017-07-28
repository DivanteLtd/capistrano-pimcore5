include Capistrano::Pimcore5::Helpers

namespace :pimcore do # rubocop:disable Metrics/BlockLength
  namespace :user do
    desc 'Reset Pimcore user password'
    task :'reset-password' do
      on release_roles :all do
        within release_path do
          raise 'Pleas set user name or id' unless ENV['user']
          raise 'Pleas set password' unless ENV['pass']

          user = ENV['user']
          pass = ENV['pass']

          params = [
            'pimcore:user:reset-password',
            user.to_s,
            "-p#{pass}"
          ]
          params.push("--env=#{pimcore_environment}") unless pimcore_environment.empty?

          execute :pimcore, params
        end
      end
    end
  end

  desc 'Generate class maps to improve performance'
  task :'classmap-generator' do
    on release_roles :all do
      within release_path do
        params = [
          'classmap-generator'
        ]
        params.push("--env=#{pimcore_environment}") unless pimcore_environment.empty?

        execute :pimcore, params
      end
    end
  end

  desc 'Optimize and warmup mysql database'
  task :'mysql-tools' do
    on release_roles :all do
      within release_path do
        params = [
          'mysql-tools'
        ]
        params.push("--env=#{pimcore_environment}") unless pimcore_environment.empty?

        execute :pimcore, params
      end
    end
  end

  desc 'Update pimcore to the desired version/build'
  task :update do
    on release_roles :all do
      within release_path do
        params = [
          'update'
        ]
        params.push("--env=#{pimcore_environment}") unless pimcore_environment.empty?

        execute :pimcore, params
      end
    end
  end

  desc 'Re-indexes the backend search of pimcore'
  task :'search-backend-reindex' do
    on release_roles :all do
      within release_path do
        params = [
          'search-backend-reindex'
        ]
        params.push("--env=#{pimcore_environment}") unless pimcore_environment.empty?

        execute :pimcore, params
      end
    end
  end

  namespace :cache do
    desc 'Flush Pimcore cache storage'
    task :clear do
      on release_roles :all do
        within release_path do
          params = [
            'cache:clear'
          ]
          params.push("--env=#{pimcore_environment}") unless pimcore_environment.empty?

          execute :pimcore, params
        end
      end
    end

    task :warming do
      desc 'Warmup Pimcore cache storage'
      on release_roles :all do
        within release_path do
          params = [
            'cache:warming'
          ]
          params.push("--env=#{pimcore_environment}") unless pimcore_environment.empty?

          execute :pimcore, params
        end
      end
    end
  end

  namespace :deployment do
    desc 'Rebuild Pimcore classes'
    task :'classes-rebuild' do
      on release_roles :all do
        within release_path do
          params = [
            'deployment:classes-rebuild --create-classes'
          ]
          params.push("--env=#{pimcore_environment}") unless pimcore_environment.empty?

          execute :pimcore, params
        end
      end
    end
  end

  # rubocop:disable Metrics/BlockLength
  namespace :thumbnails do
    desc 'Generate Pimcore image thumbnails'
    task :image do
      on release_roles :all do
        within release_path do
          params = [
            'thumbnails:image'
          ]
          params.push("--env=#{pimcore_environment}") unless pimcore_environment.empty?

          execute :pimcore, params
        end
      end
    end

    desc 'Optimize Pimcore filesize of all images'
    task :'optimize-images' do
      on release_roles :all do
        within release_path do
          params = [
            'thumbnails:optimize-images'
          ]
          params.push("--env=#{pimcore_environment}") unless pimcore_environment.empty?

          execute :pimcore, params
        end
      end
    end

    desc 'Generate Pimcore video thumbnails'
    task :video do
      on release_roles :all do
        within release_path do
          params = [
            'thumbnails:video'
          ]
          params.push("--env=#{pimcore_environment}") unless pimcore_environment.empty?

          execute :pimcore, params
        end
      end
    end
  end

  namespace :definition do
    namespace :import do
      desc 'Import Class definition from a JSON export'
      task :class do
        on release_roles :all do
          within release_path do
            params = [
              'cdefinition:import:class'
            ]
            params.push("--env=#{pimcore_environment}") unless pimcore_environment.empty?

            execute :pimcore, params
          end
        end
      end

      desc 'Import FieldCollection definition from a JSON export'
      task :fieldcollection do
        on release_roles :all do
          within release_path do
            params = [
              'definition:import:fieldcollection'
            ]
            params.push("--env=#{pimcore_environment}") unless pimcore_environment.empty?

            execute :pimcore, params
          end
        end
      end

      desc 'Import ObjectBrick definition from a JSON export'
      task :objectbrick do
        on release_roles :all do
          within release_path do
            params = [
              'definition:import:objectbrick'
            ]
            params.push("--env=#{pimcore_environment}") unless pimcore_environment.empty?

            execute :pimcore, params
          end
        end
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
