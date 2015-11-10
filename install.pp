class steamCMD::install {
	package { 'lib32gcc1':
		ensure => latest,
	}
	archive { 'steamCMD':
		ensure => present,
		url => $steamCMD::url,
		target => $::steamCMD::install_directory,
	}
	user { 'steam':
		ensure => 'present',
		comment => 'User account for the steamCMD application. Created by puppet.',
		gid => '1101',
		home => $::steamCMD::install_directory,
		uid => '1101',
	}
	exec { "./steamcmd +runscript install_csgo":
		user => 'steam',
		cwd => $::steamCMD::install_directory,
	}
}
