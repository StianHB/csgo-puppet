class steamCMD::install (
	$url 			= $::steamCMD::url,
	$install_directory 	= $::steamCMD::install_directory,
	) {
	package { 'lib32gcc1':
		ensure => latest,
	}
	archive { 'steamCMD':
		ensure => present,
		url => $url,
		target => $install_directory,
	}
	user { 'steam':
		ensure => 'present',
		comment => 'User account for the steamCMD application. Created by puppet.',
		gid => '1101',
		home => $install_directory,
		uid => '1101',
	}
	exec { "${install_directory}/steamcmd +runscript install_csgo":
		user => 'steam',
		cwd => $install_directory,
	}
}
