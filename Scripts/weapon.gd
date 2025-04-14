extends Node2D

@export_category("tiro")
@onready var bullet_holder = $BulletHolder
var bullet = preload("res://Scenes/bullet.tscn")

func _ready() -> void:
	shoot()

func shoot() -> void:
	while true:
		await timer(1)
		var bullet_i = bullet.instantiate()
		bullet_i.global_position = global_position + Vector2(0,-20)
		bullet_holder.add_child(bullet_i)
		print("shoot")

func timer(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
