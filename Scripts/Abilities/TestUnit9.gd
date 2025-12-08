extends Ability

func _init() -> void:
	ability_name = "Mate in 3"
	ability_type = "dash"
	targeting_type = "nearest_enemy"
	damage = 50.0
	enemy_status_effect_afflictions = ["Check"]
	duration = 0.5
	cast_time = 0.5
	global = true
