extends Ability

func _init() -> void:
	ability_name = "Bunny Hop"
	ability_type = "dash"
	targeting_type = "random_enemy"
	ability_description = "Dash to a random enemy, dealing heavy damage and \napplying the Vulnerable status effect to them. \nVulnerable makes units take 10% more damage."
	damage = 60.0
	enemy_status_effect_afflictions = ["Vulnerable"]
	duration = 0.7
	cast_time = 0.25
	targets_enemies = true
	global = true
