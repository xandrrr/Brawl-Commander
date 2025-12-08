extends Ability

func _init() -> void:
	ability_name = "Mindbreaker"
	ability_type = "projectile"
	damage = 50.0
	speed = 5.0
	cast_time = 0.25
	enemy_status_effect_afflictions = ["Feared"]
	targets_enemies = true
	targets_allies = false
	size = Vector3(.5,.5,.5)
