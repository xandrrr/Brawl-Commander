extends Ability

func _init() -> void:
	ability_name = "Feral Dash"
	ability_type = "dash"
	targeting_type = "nearest_enemy"
	ability_description = "Dash to the nearest enemy, doing heavy damage and \napplying Bleed. Bleed causes units to lose \n 1% of their max HP every second."
	damage = 60.0
	enemy_status_effect_afflictions = ["Bleed"]
	duration = 0.5
	cast_time = 0.5
	targets_enemies = true
	global = true
