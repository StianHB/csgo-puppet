class steamCMD::config (
	$install_directory 	= $steamCMD::install_directory,
	$login 			= $steamCMD::login,
	$password 		= $steamCMD::password,
	$app_id 		= $steamCMD::app_id,
	$config_path 		= $steamCMD::config_path,
	) {
	$str = "login $login"
	if $password {
		$pt2 = "@NoPromptForPassword 1
			${str} ${password}"
	}
	$fin = "${pt2}
		force_install_dir ${install_directory}
		app_update ${app_id} validate
		quit"

	file { "$config_path":
		ensure => present,
		content => "$fin",
		owner => "steam",
	}
}
