extends Ability

func _init() -> void:
	ability_name = "Flutter"
	ability_type = "dash"
	targeting_type = "nearest_enemy"
	ability_description = "Dash to the nearest enemy and apply damage to them. \nCupid gains Health Regeneration afterwards."
	damage = 40.0
	self_status_effect_afflictions = ["Regeneration"]
	targets_enemies = true
	duration = 1.5
	cast_time = 1.5
	global = false
