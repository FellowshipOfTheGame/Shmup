extends CharacterBody2D

@export var horizontal_speed : int = 100
@export var horizontal_time : float = 1.0
@export var move_right : bool # comeca mexendo pra direita ou pra esquerda
@export var vertical_speed : int = 100
@export var vertical_time : float = 1.0

func _ready() -> void:
	add_to_group("enemy")
	velocity = Vector2( horizontal_speed if move_right else -horizontal_speed, 0)
	movement_loop()

func _physics_process(_delta: float) -> void:
	move_and_slide()

func movement_loop() -> void:
	while true:
		await timer(horizontal_time)
		velocity = Vector2(0, vertical_speed)
		await timer(vertical_time)
		move_right = not move_right
		velocity = Vector2(horizontal_speed if move_right else -horizontal_speed, 0)

func timer(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
