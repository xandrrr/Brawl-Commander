extends Ability

func _init() -> void:
	ability_name = "Overclock"
	ability_type = "targetable"
	targeting_type = "nearest_ally"
	ally_status_effect_afflictions = ["Overclocked", "Regeneration"]
	cast_time = 1.5
	global = true
