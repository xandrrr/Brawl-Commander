extends Ability

func _init() -> void:
	ability_name = "Webweaver"
	ability_type = "area_attack"
	ability_shape = "cylinder"
	targeting_type = "self"
	duration = 8.0
	tick_time = 1.0
	damage = 10.0
	cast_time = 4.0
	enemy_status_effect_afflictions = ["Silenced", "Antiheal"]
	targets_enemies = true
	targets_allies = false
	size = Vector3(5,1,5)
