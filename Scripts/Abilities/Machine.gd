extends Ability

func _init() -> void:
	ability_name = "Laser Precision"
	ability_type = "targetable"
	targeting_type = "self"
	ability_description = "Gain Duality, causing the Machine's Attacks \nto also deal damage equal to 50% of its \nAbility Power."
	ally_status_effect_afflictions = ["Duality"]
	cast_time = .75
