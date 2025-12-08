extends Ability

func _init() -> void:
	ability_name = "Bunny Hop"
	ability_type = "dash"
	targeting_type = "random_enemy"
	damage = 60.0
	duration = 0.7
	cast_time = 0.25
	global = true
