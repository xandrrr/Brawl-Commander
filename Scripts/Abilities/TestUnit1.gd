extends Ability

func _init() -> void:
	ability_name = "Fireball"
	ability_type = "projectile"
	damage = 35.0
	speed = 5.0
	cast_time = 1.5
	targets_enemies = true
	targets_allies = false
	size = Vector3(.35,.35,.35)
