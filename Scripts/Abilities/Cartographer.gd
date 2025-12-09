extends Ability

func _init() -> void:
	ability_name = "Update Map"
	ability_type = "targetable"
	ability_description = "Damage the nearest enemy and apply Charted, \nreducing their damage dealt for the \nduration of the effect."
	targeting_type = "nearest_enemy"
	enemy_status_effect_afflictions = ["Charted"]
	damage = 40.0
	cast_time = 1.5
	global = false
