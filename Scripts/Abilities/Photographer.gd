extends Ability

func _init() -> void:
	ability_name = "Photograph"
	ability_type = "targetable"
	targeting_type = "nearest_enemy"
	damage = 35.0
	ally_status_effect_afflictions = ["Stunned"]
	cast_time = 2.0
	global = true
