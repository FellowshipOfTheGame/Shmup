extends "res://scripts/bullet_stats/b_default_lvl_1.gd"

func get_stats() -> Dictionary: # GDScript ainda nao tem structs, entao tem que passar um dicionario
	return {
		"weapon_fire_time": 1/weapon_fire_rate*2.5,
		"weapon_spread": 0,
		"bullet_damage": 20,
		"bullet_scene":  bullet_scene,
		"bullet_speed": -200,
		"bullet_offset": 75
	}

# pra dar override nas funcoes dos filhos tem que fazer isso
#func get_stats() -> Dictionary:
	## Get base stats from parent
	#var stats = super.get_stats()
	
	## Add new stats
	#stats["explosion_radius"] = explosion_radius
	#return stats
