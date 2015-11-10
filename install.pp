class steamCMD::install {
	$install_directory = $::steamCMD::install_directory
} {
	package { [lib32gccl]:
		ensure => latest,
	}
	archive { 'steamCMD':
		ensure => present,
		url => $steamCMD::URL,
		target => $::steamCMD::install_directory,
	}
	user { 'steam':
		ensure => 'present',
		comment => 'User account for the steamCMD application. Created by puppet.'
		gid => 1001,
		home => $::steamCMD::install_directory,
		uid => 1001,
	}
	exec { "./steamcmd +runscript install_csgo"
		user => 'steam',
		cwd => $::steamCMD::install_directory,
	}
}
