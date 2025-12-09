extends Ability

func _init() -> void:
	ability_name = "Smoke and Mirrors"
	ability_type = "dash"
	targeting_type = "random_enemy"
	ability_description = "Quickly dash to a random enemy on the \nmap,dealing damage and Disarming them. \nDisarm prevents units from Attacking."
	damage = 30.0
	enemy_status_effect_afflictions = ["Disarmed"]
	duration = 0.1
	cast_time = 0.1
	targets_enemies = true
	global = true
