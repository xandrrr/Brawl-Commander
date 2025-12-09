extends Ability

func _init() -> void:
	ability_name = "Photograph"
	ability_type = "targetable"
	targeting_type = "nearest_enemy"
	ability_description = "Instantly stun the nearest enemy \nand deal a small amount of damage."
	damage = 30.0
	enemy_status_effect_afflictions = ["Stunned"]
	cast_time = 2.0
	targets_enemies = true
	global = false
