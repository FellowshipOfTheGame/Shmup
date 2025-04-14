extends CharacterBody2D

@export_category("movimentamento")
@export var speed: int = 400
@export var accel: int = 50
var input: Vector2

func _ready() -> void:
	pass
	# get stats from a node
	# se for um missel teleguiado, rodar uma funcao com while true

func _physics_process(delta: float) -> void:
	# talvez tenha que separar o movimento vertical do horizontal pra fazer o smoothing certo
	input = Vector2( Input.get_axis("left", "right") , Input.get_axis("up", "down") )
	if input != Vector2.ZERO:
		velocity = velocity.move_toward(input * speed, accel)
	else:
		velocity = velocity.move_toward(input * speed, accel)
	
	move_and_slide() # funcao pra movimentar o player sozinho
	pass
	
