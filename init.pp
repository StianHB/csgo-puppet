class steamCMD (
	$install_directory 	= $::steamCMD::params::install_directory,
	$url 			= $::steamCMD::params::url,
	$login 			= $::steamCMD::params::login,
	$password		= $::steamCMD::params::password,
	$app_id			= $::steamCMD::params::app_id,
	$config_path		= $::steamCMD::params::config_path,
	) inherits steamCMD::params {

	#validate_absolute_path($install_directory)
	#validate_absolute_path($config_path)

}
