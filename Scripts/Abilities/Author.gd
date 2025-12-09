extends Ability

func _init() -> void:
	ability_name = "Plot Twist"
	ability_type = "dash"
	ability_description = "Dash to the nearest ally and receive Lifesteal momentarily. \nLifesteal heals units for 10% of damage they deal through Attacks."
	targeting_type = "nearest_ally"
	self_status_effect_afflictions = ["Lifesteal"]
	targets_allies = true
	duration = 0.25
	cast_time = 0.25
	global = true
