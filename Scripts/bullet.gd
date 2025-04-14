extends CharacterBody2D

@export_category("movimentamento")
@export var speed: int = 700
@export var damage := 100
@onready var hitbox = $Area2D

func _ready() -> void:
	velocity = Vector2(0, -speed)
	hitbox.body_entered.connect(hit)

func _physics_process(delta: float) -> void:
	move_and_slide() # funcao pra movimentar o player sozinho

func hit(target: Node2D) -> void:
	print("colidiu")
	if target.is_in_group("enemy"): target.get_node("Health").take_damage(damage)
	queue_free()
