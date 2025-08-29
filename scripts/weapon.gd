extends Node2D

@export_category("tiro")
var stats : Dictionary

func _ready() -> void:
	# bullet holder = get_child(0)
	stats = get_child(0).get_stats()
	shoot()

func shoot() -> void:
	while true:
		await timer(stats["weapon_fire_time"])
		
		var bullet_i = stats["bullet_scene"].instantiate()
		# implementar spread com o stats["weapon_spread"]
		bullet_i.set_stats(stats)
		bullet_i.global_position = global_position + Vector2(0, stats["bullet_offset"])
		get_tree().current_scene.add_child(bullet_i)

func timer(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
