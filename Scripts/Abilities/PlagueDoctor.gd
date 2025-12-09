extends Ability

func _init() -> void:
	ability_name = "Doctor Things"
	ability_type = "targetable"
	targeting_type = "nearest_ally"
	ability_description = "Instantly grant the nearest \nally a large burst of healing."
	heal_amount = 75.0
	cast_time = 1.0
	targets_allies = true
	global = false
