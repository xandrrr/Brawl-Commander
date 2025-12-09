extends Ability

func _init() -> void:
	ability_name = "Arrow Volley"
	ability_type = "area_attack"
	ability_shape = "cylinder"
	targeting_type = "nearest_enemy"
	duration = 5.0
	damage = 15.0
	tick_time = 1.0
	cast_time = 0.5
	targets_enemies = true
	targets_allies = false
	size = Vector3(7,1,7)
