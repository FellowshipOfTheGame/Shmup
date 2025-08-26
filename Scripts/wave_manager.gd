extends Node2D

var can_spawn: bool = true
var wave_count: int
var enemy_count: int
var player_score: int
@export var enemy_1: PackedScene
#@export var enemy_2: PackedScene
@export var time_between_waves: float = 1
@export var time_between_spawns: float = 1
@onready var screen_width: int = get_window().size.x
@onready var screen_height_offset: int = ceil( get_window().size.y * -0.05 ) # offset pros inimigos aparecerem logo fora da tela

func _ready() -> void:
	timer(0)
	spawn_enemies()

func spawn_enemies():
	var wave_size: int
	var enemy_scene: PackedScene
	var enemy_movement: String
	
	while not can_spawn: get_tree().process_frame
	await timer(time_between_waves)
	wave_count += 1
	print("wave count: ", wave_count)
	
	match randi_range(0, 2): # escolhe entre os sets de waves
		0:
			wave_size = 3
			enemy_scene = enemy_1
			enemy_movement = "vertical"
		1:
			wave_size = 2
			enemy_scene = enemy_1
			enemy_movement = "zigzag"
		2:
			wave_size = 4
			enemy_scene = enemy_1
			enemy_movement = "square"
	
	can_spawn = false
	for i in range(wave_size):
		var spawned_enemy = enemy_scene.instantiate() as Enemy
		add_child(spawned_enemy) # a scena tem que ser instanciada pra poder rodar o _onready e inicializar
		enemy_count += 1
		
		spawned_enemy.position = Vector2( (i+1) * screen_width / (wave_size+1), screen_height_offset ) # spawna os inimigos igualmente espacados ao centro da tela
		print("enemy ", i, " position: ", spawned_enemy.position)
		spawned_enemy.set_movement_type(enemy_movement)
		spawned_enemy.get_node("enemy_health").connect("enemy_killed", Callable(self, "enemy_killed"))
		await timer(time_between_spawns)
	
	can_spawn = true

func enemy_killed(kill_score: int): # linkar com o signal
	player_score += kill_score
	print(player_score)
	# funcao pra aumentar a score no HUD
	enemy_count -= 1
	if enemy_count == 0: spawn_enemies()

func timer(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
