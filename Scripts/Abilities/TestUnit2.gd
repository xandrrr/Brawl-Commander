extends Ability

func _init() -> void:
	ability_name = "Water Pool"
	ability_type = "area_attack"
	ability_shape = "cylinder"
	damage = 5.0
	speed = 5.0
	duration = 5.0
	tick_time = 1.0
	cast_time = 1.5
	targets_enemies = true
	targets_allies = false
	size = Vector3(5,1,5)
