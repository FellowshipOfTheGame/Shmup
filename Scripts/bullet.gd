extends CharacterBody2D

var stats : Dictionary
@onready var hitbox = $Area2D

func _ready() -> void:
	hitbox.body_entered.connect(hit)

func set_stats(new_stats: Dictionary) -> void:
	stats = new_stats
	velocity = Vector2( 0, -stats["bullet_speed"] )

func _physics_process(delta: float) -> void:
	move_and_slide() # funcao pra movimentar o player sozinho

func hit(target: Node2D) -> void:
	if target.is_in_group("enemy"):
		target.get_node("Health").take_damage(stats["bullet_damage"])
	queue_free() # destroy()
