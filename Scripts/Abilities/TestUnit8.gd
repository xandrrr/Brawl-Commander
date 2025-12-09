extends Ability

func _init() -> void:
	ability_name = "Command: Stop"
	ability_type = "projectile"
	targeting_type = "nearest_enemy"
	enemy_status_effect_afflictions = ["Stunned"]
	speed = 5.0
	damage = 40.0
	size = Vector3(.25,.25,.25)
	cast_time = 1.0
	targets_enemies = true
	global = true
