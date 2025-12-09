extends Ability

func _init() -> void:
	ability_name = "Mindbreaker"
	ability_type = "projectile"
	ability_description = "Fire a proectile at the nearest enemy, \napplying Silenced and doing damaged. Silenced \nprevents units from casting their ability."
	damage = 50.0
	speed = 5.0
	cast_time = 0.25
	enemy_status_effect_afflictions = ["Silenced"]
	targets_enemies = true
	targets_allies = false
	size = Vector3(.5,.5,.5)
