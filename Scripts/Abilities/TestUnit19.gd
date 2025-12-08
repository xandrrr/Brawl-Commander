extends Ability

func _init() -> void:
	ability_name = "A Christmas Miracle"
	ability_type = "dash"
	targeting_type = "random_enemy"
	damage = 20.0
	enemy_status_effect_afflictions = ["Stunned", "Vulnerable"]
	duration = 1.0
	cast_time = 0.1
	global = true
