extends Ability

func _init() -> void:
	ability_name = "Awesome Exploding Projectile"
	ability_type = "exploding_projectile"
	targeting_type = "nearest_enemy"
	speed = 2.5
	damage = 5.0
	heal_amount = 5.0
	tick_time = 1.0
	duration = 3.0
	size = Vector3(4,1,4)
	cast_time = 0.5
	targets_enemies = true
	targets_allies = true
	global = false
