extends Ability

func _init() -> void:
	ability_name = "Epic Dash"
	ability_type = "dash"
	targeting_type = "nearest_enemy"
	duration = 1.5
	cast_time = 0.5
	global = true
