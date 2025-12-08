extends Ability

func _init() -> void:
	ability_name = "Flashbang"
	ability_type = "projectile"
	damage = 35.0
	speed = 7.5
	cast_time = 0.5
	enemy_status_effect_afflictions = ["Stunned"]
	targets_enemies = true
	targets_allies = false
	size = Vector3(.35,.35,.35)
