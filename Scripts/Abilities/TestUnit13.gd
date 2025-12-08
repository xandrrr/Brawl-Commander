extends Ability

func _init() -> void:
	ability_name = "Love Bomb"
	ability_type = "exploding_projectile"
	targeting_type = "nearest_enemy"
	speed = 5.0
	damage = 40.0
	heal_amount = 20.0
	duration = 0.1
	cast_time = 1.0
	global = true
