class steamCMD (
	$install_directory 	= $::steamCMD::params::install_directory,
	$URL 			= $::steamCMD::params::URL,
	$login 			= $::steamCMD::params::login,
	$password		= $::steamCMD::params::password,
	$app_id			= $::steamCMD::params::app_id,
	$config_path		= $::steamCMD::params::config_path,
	) inherits steamCMD::params {

	validate_absolute_path($install_directory)

}
