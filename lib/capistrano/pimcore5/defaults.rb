set :env, 'development'

set :linked_files, fetch(:linked_files, []).push

set :linked_dirs, fetch(:linked_dirs, []).push(
  'vendor',
  'var/classes/Object',
  'var/config',
  'var/log',
  'var/recyclebin',
  'var/tmp',
  'var/versions'
)
