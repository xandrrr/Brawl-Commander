extends Ability

func _init() -> void:
	ability_name = "Herald"
	ability_type = "dash"
	targeting_type = "nearest_ally"
	ability_description = "Dash to the nearest ally and grant them Lifesteal momentarily. \nLifesteal heals units for 10% of damage they deal through Attacks."
	heal_amount = 20.0
	ally_status_effect_afflictions = ["Lifesteal"]
	duration = 2.5
	cast_time = 2.5
	targets_allies = true
	global = true
