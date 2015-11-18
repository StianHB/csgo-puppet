class steamcmd (
	$install_directory 	= $::steamcmd::params::install_directory,
	$url 			= $::steamcmd::params::url,
	$login 			= $::steamcmd::params::login,
	$password		= $::steamcmd::params::password,
	$app_id			= $::steamcmd::params::app_id,
	$config_path		= $::steamcmd::params::config_path,
	) inherits steamcmd::params {

	contain steamcmd::config
	contain steamcmd::install
}
