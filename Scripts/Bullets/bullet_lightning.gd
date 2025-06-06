extends "res://Scripts/Bullets/bullet_default.gd"

var bounce_range : float = 100.0
var bounces : int = 0
@onready var area := $Area2D2

func on_hit() -> void:
	if bounces < stats["bounce_amount"]:
		bounces += 1
		var bodies = area.get_overlapping_bodies()
		bodies.shuffle()
		for body in bodies:
			if body != last_hit_object:
				adjust_rotation(body)
				return
	queue_free() # se nao tiver pra quem ricochetear, destroy()

func adjust_rotation(body: Node2D) -> void:
	var direction = body.position - position
	rotation = direction.angle() + PI/2
	velocity = direction.normalized() * stats["bullet_speed"]
