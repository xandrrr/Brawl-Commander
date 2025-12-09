extends Ability

func _init() -> void:
	ability_name = "Checkmate"
	ability_type = "dash"
	targeting_type = "nearest_enemy"
	damage = 50.0
	enemy_status_effect_afflictions = ["Stunned", "Vulnerable"]
	ability_description = "Dash to the nearest enemy on the map, \nregardless of distance. Upon arrival, deal \ndamage and apply Stunned and Vulnerable. \nVulnerable increases all damage dealt to a unit by 10%."
	targets_enemies = true
	duration = 0.5
	cast_time = 0.5
	global = true
