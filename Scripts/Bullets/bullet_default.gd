extends CharacterBody2D

var stats : Dictionary
var last_hit_object : Object = null
@onready var hitbox = $Area2D

func _ready() -> void:
	hitbox.body_entered.connect(hit)

func set_stats(new_stats: Dictionary) -> void:
	stats = new_stats
	velocity = Vector2( 0, -stats["bullet_speed"] )

func _physics_process(delta: float) -> void:
	move_and_slide()

func hit(target: Node2D) -> void:
	if target == last_hit_object: return # nao dar dano no mesmo alvo de novo
	last_hit_object = target
	if target.is_in_group("enemy"):
		target.get_node("Health").take_damage(stats["bullet_damage"])
		on_hit()
	#else: animacao de destruir

func on_hit() -> void:
	queue_free() # destroy()
