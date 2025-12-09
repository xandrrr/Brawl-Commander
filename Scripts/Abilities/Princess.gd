extends Ability

func _init() -> void:
	ability_name = "Command: Stop"
	ability_type = "projectile"
	targeting_type = "nearest_enemy"
	enemy_status_effect_afflictions = ["Stunned"]
	ability_description = "Fire a projectile at the nearest enemy on the map, \nregardless of distance. The projectile afflicts \nStunned upon landing and does damage."
	speed = 15.0
	damage = 40.0
	size = Vector3(.25,.25,.25)
	cast_time = 1.0
	targets_enemies = true
	global = true
