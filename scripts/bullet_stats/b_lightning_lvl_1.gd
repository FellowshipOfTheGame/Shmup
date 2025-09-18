extends "res://scripts/bullet_stats/b_default_lvl_1.gd"

@export var bounce_amount : int = 3

func get_stats() -> Dictionary:
	# Get base stats from parent
	var stats = super.get_stats()
	
	# Add new stats
	stats["bounce_amount"] = bounce_amount
	return stats
