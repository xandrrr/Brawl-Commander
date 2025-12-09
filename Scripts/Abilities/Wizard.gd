extends Ability

func _init() -> void:
	ability_name = "Bestow Sickness"
	ability_type = "projectile"
	targeting_type = "nearest_enemy"
	enemy_status_effect_afflictions = ["Poison"]
	speed = 6.0
	damage = 25.0
	size = Vector3(.4,.4,.4)
	cast_time = 0.5
	targets_enemies = true
	targets_allies = false
	global = false
