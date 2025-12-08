extends Ability

func _init() -> void:
	ability_name = "Doctor Things"
	ability_type = "exploding_projectile"
	targeting_type = "nearest_ally"
	speed = 5.0
	heal_amount = 50.0
	duration = 0.1
	cast_time = 1.0
	global = false
