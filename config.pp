class steamCMD::config (
	$install_directory 	= $steamCMD::install_directory,
	$login 			= $steamCMD::login,
	$password 		= $steamCMD::password,
	$app_id 		= $steamCMD::app_id,
	$config_path 		= $steamCMD::config_path,
	) {
	$str = "login $login"
	if $password {
		$str = "@NoPromptForPassword 1
			${str} ${password}"
	}
	$str = "${str}
		force_install_dir ${install_directory}
		app_update ${app_id} validate
		quit"

	file { "$config_path":
		ensure => present,
		content => "$str",
		owner => "steam",
	}
	exec { 'launch steamcmd':
		command => "${install_directory}/steamcmd +runscript ${config_path}",
		user => "steam",
	}
}
