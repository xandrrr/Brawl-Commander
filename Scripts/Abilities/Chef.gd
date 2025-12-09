extends Ability

func _init() -> void:
	ability_name = "Bon Appétit!"
	ability_type = "area_attack"
	ability_shape = "cylinder"
	targeting_type = "self"
	duration = 0.2
	tick_time = 0.15
	damage = 30.0
	cast_time = 0.5
	enemy_status_effect_afflictions = ["Poison", "Antiheal"]
	targets_enemies = true
	targets_allies = false
	size = Vector3(5,.35, 5)
