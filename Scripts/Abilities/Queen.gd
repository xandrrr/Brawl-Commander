extends Ability

func _init() -> void:
	ability_name = "Checkmate"
	ability_type = "dash"
	targeting_type = "nearest_enemy"
	damage = 50.0
	enemy_status_effect_afflictions = ["Stunned", "Vulnerable"]
	targets_enemies = true
	duration = 0.5
	cast_time = 0.5
	global = true
