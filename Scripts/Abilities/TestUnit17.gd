extends Ability

func _init() -> void:
	ability_name = "Smoke and Mirrors"
	ability_type = "dash"
	targeting_type = "random_enemy"
	damage = 30.0
	enemy_status_effect_afflictions = ["Disarm"]
	duration = 0.1
	cast_time = 0.1
	global = true
