extends Ability

func _init() -> void:
	ability_name = "Doctor Things"
	ability_type = "targetable"
	targeting_type = "nearest_ally"
	heal_amount = 75.0
	cast_time = 1.0
	targets_allies = true
	global = false
