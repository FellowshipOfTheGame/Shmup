extends Node2D

@export_category("tiro")
@onready var bullet_holder = $BulletHolder
var stats : Dictionary

func _ready() -> void:
	# bullet holder = get_child(0)
	stats = get_child(1).get_stats()
	shoot()

func shoot() -> void:
	while true:
		await timer(stats["weapon_fire_time"])
		
		var bullet_i = stats["bullet_scene"].instantiate()
		# implementar spread com o stats["weapon_spread"]
		bullet_i.set_stats(stats)
		bullet_i.global_position = global_position + Vector2(0,-20)
		bullet_holder.add_child(bullet_i)

func timer(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
