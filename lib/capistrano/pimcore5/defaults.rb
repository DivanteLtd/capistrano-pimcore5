set :env, 'development'

set :linked_files, fetch(:linked_files, []).push(
	'var/config/system.php',
	'var/config/debug-mode.php',
	'var/config/maintenance.php',
)

set :linked_dirs, fetch(:linked_dirs, []).push(
  'vendor',
  'var/classes/Object',
  'var/log',
  'var/recyclebin',
  'var/tmp',
  'var/versions'
)
