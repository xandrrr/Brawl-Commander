extends Ability

func _init() -> void:
	ability_name = "Plot Twist"
	ability_type = "dash"
	targeting_type = "nearest_ally"
	self_status_effect_afflictions = ["Lifesteal"]
	duration = 0.25
	cast_time = 0.25
	global = true
