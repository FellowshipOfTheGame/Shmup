extends "res://Scripts/WeaponLevels/w_default.gd"

@export var bounce_amount : int

func get_stats() -> Dictionary:
	# Get base stats from parent
	var stats = super.get_stats()
	
	# Add new stats
	stats["bounce_amount"] = bounce_amount
	return stats
