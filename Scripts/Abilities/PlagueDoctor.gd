extends Ability

func _init() -> void:
	ability_name = "Doctor Things"
	ability_type = "projectile"
	targeting_type = "nearest_ally"
	speed = 5.0
	heal_amount = 75.0
	cast_time = 1.0
	global = false
