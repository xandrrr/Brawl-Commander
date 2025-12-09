extends Ability

func _init() -> void:
	ability_name = "Laser Precision"
	ability_type = "targetable"
	targeting_type = "self"
	ally_status_effect_afflictions = ["Duality"]
	cast_time = .75
