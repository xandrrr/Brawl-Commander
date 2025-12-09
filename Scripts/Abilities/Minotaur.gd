extends Ability

func _init() -> void:
	ability_name = "Protect the Weak"
	ability_type = "targetable"
	ability_description = "Apply Safeguard to the nearest ally, \npreventing them from taking damage if \ntheir HP is 30% or lower."
	targeting_type = "nearest_ally"
	ally_status_effect_afflictions = ["Safeguard"]
	cast_time = .75
	global = true
