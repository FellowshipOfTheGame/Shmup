extends "res://Scripts/health.gd"
class_name EnemyHealth

@export var life_time: float = 10
var kill_score: int = 10
signal enemy_killed

func _onready() -> void:
	await timer(life_time)
	queue_free() # depois de um tempo, mata o inimigo se o player nao conseguiu

func die() -> void:
	#enemy_killed.emit()
	emit_signal("enemy_killed", kill_score)
	super.die() # faz o resto da funcao padrao

func timer(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
