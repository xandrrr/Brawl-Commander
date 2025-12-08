extends Ability

func _init() -> void:
	ability_name = "Chilling Roar"
	ability_type = "area_attack"
	ability_shape = "cylinder"
	targeting_type = "nearest_enemy"
	duration = 8.0
	damage = 8.0
	tick_time = 0.5
	cast_time = 1.0
	enemy_status_effect_afflictions = ["Silenced"]
	targets_enemies = true
	targets_allies = false
	size = Vector3(5,1,5)
