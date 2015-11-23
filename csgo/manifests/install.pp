class csgo::install (
	$srcds_path 	= $::csgo::srcds_path,
	$map 		= $::csgo::map,
	$game_type	= $::csgo::game_type,
	$game_mode	= $::csgo::game_mode,
	$mapgroup	= $::csgo::mapgroup,
	) {
	$str = "#!/bin/bash
$(ln -s \$1/Counter-Strike\\ Global\\ Offensive\\ Beta\\ -\\ Dedicated\\ Server \$1/nospace)
"
	file { "${srcds_path}/syml.sh":
		ensure => present,
		owner => 'steam',
		content => $str,
		mode => '0555',
	}
	exec { "${srcds_path}/syml.sh ${srcds_path}": 
		user => 'steam',
		require => File["${srcds_path}/syml.sh"],
		unless => "/usr/bin/test -f ${srcds_path}/syml.sh",
	}
	exec { "${srcds_path}/nospace/srcds_run -game csgo -console -usercon +game_type ${game_type} +game_mode ${game_mode} +mapgroup ${mapgroup} +map ${map} &":
		user => 'steam',
		unless => "/usr/bin/pgrep -u steam -f srcds",
		require => Exec["${srcds_path}/syml.sh ${srcds_path}"],
	}
}
