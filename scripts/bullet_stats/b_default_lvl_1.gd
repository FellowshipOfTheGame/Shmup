extends Node

@export var bullet_scene: PackedScene
@export var weapon_spread: float = 0
@export var weapon_fire_rate: float = 1
@export var bullet_speed: int = 750
@export var bullet_damage: int = 50
@export var bullet_offset: int = -20 # pra atirar um pouco a frente do player e nao ter auto colisao

func get_stats() -> Dictionary: # GDScript ainda nao tem structs, entao tem que passar um dicionario
	return {
		"weapon_fire_time": 1/weapon_fire_rate,
		"weapon_spread": weapon_spread,
		"bullet_damage": bullet_damage,
		"bullet_scene":  bullet_scene,
		"bullet_speed":  bullet_speed,
		"bullet_offset": bullet_offset
	}

# pra dar override nas funcoes dos filhos tem que fazer isso
#func get_stats() -> Dictionary:
	## Get base stats from parent
	#var stats = super.get_stats()
	
	## Add new stats
	#stats["explosion_radius"] = explosion_radius
	#return stats
