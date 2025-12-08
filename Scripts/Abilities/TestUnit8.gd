extends Ability

func _init() -> void:
	ability_name = "Command: Run"
	ability_type = "exploding_projectile"
	targeting_type = "nearest_ally"
	damage = 40.0
	heal_amount = 25.0
	ally_status_effect_afflictions = ["Feared"]
	duration = 0.1
	cast_time = 1.0
	global = true
