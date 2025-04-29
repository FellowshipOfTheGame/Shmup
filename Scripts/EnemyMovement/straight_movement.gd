extends CharacterBody2D

@export var angle : float
@export var vertical_speed : int

func _ready() -> void:
	add_to_group("enemy")
	rotation = deg_to_rad(angle)
	velocity = Vector2( 0, vertical_speed).rotated(rotation)

func _physics_process(_delta: float) -> void:
	move_and_slide()
