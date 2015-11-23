class csgo (
	$srcds_path 	= $::csgo::params::srcds_path,
	$game_type 	= $::csgo::params::game_type,
	$game_mode 	= $::csgo::params::game_mode,
	$map		= $::csgo::params::map,
	$mapgroup	= $::csgo::params::mapgroup,
	) inherits csgo::params {
	contain csgo::install
}
