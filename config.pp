class steamcmd::config (
	$install_directory 	= $steamcmd::install_directory,
	$login 			= $steamcmd::login,
	$password 		= $steamcmd::password,
	$app_id 		= $steamcmd::app_id,
	$config_path 		= $steamcmd::config_path,
	) {
	user { 'steam':
		ensure => present,
		comment => 'User account for the steamcmd application. Created by puppet.',
		managehome => true,
	}
	file { $install_directory:
		ensure => 'directory',
		owner => 'steam',
		group => 'steam',
		mode => '0644',
	}

	$str = "login $login"
	if $password {
		$pt2 = "@NoPromptForPassword 1
${str} ${password}"
	}
	else { $pt2 = $str }
	$fin = "${pt2}
force_install_dir ${install_directory}
app_update ${app_id} validate
quit
"

	file { "$config_path":
		ensure => present,
		content => "$fin",
		owner => 'steam',
		group => 'steam',
		mode => '0644',
	}
}
