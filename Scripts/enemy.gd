extends CharacterBody2D
class_name Enemy

@onready var health_node: EnemyHealth = $enemy_health
@export var horizontal_speed: int = 100
@export var horizontal_time: float = 1.0
@export var vertical_speed: int = 75
@export var vertical_time: float = 1.0
@export var move_right: bool # comeca mexendo pra direita ou pra esquerda
@export var angle: float # em radianos, considerando movimento pra baixo com 0rad

func _ready() -> void:
	add_to_group("enemy")

func _physics_process(_delta: float) -> void:
	move_and_slide()

# health attributions
func set_health(new_health: int) -> void:
	health_node.health = new_health

func set_movement_type(movement_type: String) -> void:
	match movement_type:
		"zigzag": zigzag()
		"square": square()
		_: vertical()

func vertical() -> void:
	rotation = deg_to_rad(angle)
	velocity = Vector2(0, vertical_speed).rotated(rotation)

func zigzag() -> void:
	while true:
		velocity = Vector2(horizontal_speed if move_right else -horizontal_speed, vertical_speed)
		move_right = not move_right
		await timer(horizontal_time)

func square() -> void:
	while true:
		velocity = Vector2(0, vertical_speed)
		await timer(horizontal_time)
		velocity = Vector2(horizontal_speed if move_right else -horizontal_speed, 0)
		move_right = not move_right
		await timer(vertical_time)

func timer(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
