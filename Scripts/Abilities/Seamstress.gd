extends Ability

func _init() -> void:
	ability_name = "Needlework"
	ability_type = "area_attack"
	ability_shape = "cylinder"
	targeting_type = "self"
	ability_description = "Disarm all nearby enemies."
	duration = 0.15
	tick_time = 0.1
	damage = 35.0
	cast_time = 2.0
	enemy_status_effect_afflictions = ["Disarmed"]
	targets_enemies = true
	targets_allies = false
	size = Vector3(5,.35, 5)
