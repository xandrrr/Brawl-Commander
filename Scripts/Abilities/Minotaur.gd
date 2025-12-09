extends Ability

func _init() -> void:
	ability_name = "Protect the Weak"
	ability_type = "targetable"
	targeting_type = "nearest_ally"
	ally_status_effect_afflictions = ["Safeguard"]
	cast_time = .75
	global = true
