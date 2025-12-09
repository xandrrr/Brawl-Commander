extends Ability

func _init() -> void:
	ability_name = "Bunny Hop"
	ability_type = "dash"
	targeting_type = "random_enemy"
	damage = 60.0
	enemy_status_effect_afflictions = ["Vulnerable"]
	duration = 0.7
	cast_time = 0.25
	targets_enemies = true
	global = true
