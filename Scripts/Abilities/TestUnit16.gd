extends Ability

func _init() -> void:
	ability_name = "Feral Dash"
	ability_type = "dash"
	targeting_type = "nearest_enemy"
	damage = 60.0
	enemy_status_effect_afflictions = ["Bleed"]
	duration = 0.5
	cast_time = 0.5
	global = true
