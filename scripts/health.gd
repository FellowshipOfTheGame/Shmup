extends Node

@export var health := 100

func set_health(new_health: int) -> void:
	health = new_health

func take_damage(damage: int) -> void:
	health -= damage
	if health <= 0: die()

func die() -> void:
	get_parent().queue_free()
