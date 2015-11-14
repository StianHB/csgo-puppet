class steamCMD::install (
	$url 			= $::steamCMD::url,
	$install_directory 	= $::steamCMD::install_directory,
	) {
	include 'archive'
	package { 'lib32-gcc-libs': #for Arch linux
		ensure => latest,
	}
	archive { "$install_directory":
		ensure => present,
		source => $url,
		extract => true,
		extract_path => $install_directory,
	}
	user { 'steam':
		ensure => 'present',
		comment => 'User account for the steamCMD application. Created by puppet.',
		home => $install_directory,
		uid => '1101',
	}
	exec { "${install_directory}/steamcmd +runscript install_csgo":
		require => Archive["$install_directory"],
		user => 'steam',
		cwd => $install_directory,
	}
}
