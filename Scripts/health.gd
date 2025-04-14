extends Node

@export var health := 100

func take_damage(damage: int) -> void:
	health -= damage
	if health <= 0: die()

func die() -> void:
	get_parent().queue_free()
