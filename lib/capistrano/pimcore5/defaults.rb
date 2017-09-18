set :env, 'development'
set :pimcore_deploy_classes_rebuild, fetch(:pimcore_deploy_classes_rebuild, true)

set :linked_files, fetch(:linked_files, []).push(
	'var/config/system.php',
	'var/config/debug-mode.php',
  'var/config/extensions.php',
	'app/config/parameters.yml',
)

set :linked_dirs, fetch(:linked_dirs, []).push(
  'vendor',
  'var/classes/Object',
  'var/log',
  'var/recyclebin',
  'var/tmp',
  'var/versions',
  'web/var'
)
