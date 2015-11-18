class steamcmd::install (
	$url 			= $::steamcmd::url,
	$install_directory 	= $::steamcmd::install_directory,
	) {
	$steam_dependency = $osfamily ? {
		'Debian' => 'lib32gcc1',
		'Ubuntu' => 'lib32gcc1',
		'Arch' => 'lib32-gcc-libs',
		'RedHat' => 'libstdc++.i686',
		'CentOS' => 'libstdc++.i686',
		default => 'lib32gcc1',
	}
	package { $steam_dependency:
		ensure => latest,
	}
	archive { 'stcmd':
		user => 'steam',
		checksum => false,
		target => $install_directory,
		ensure => present,
		url => $url,
		src_target => '/tmp'
	}
	exec { "${install_directory}/steamcmd.sh +runscript conf &":
		timeout => 0,
		require => Archive['stcmd'],
		user => 'steam',
		cwd => $install_directory,
	}
}
