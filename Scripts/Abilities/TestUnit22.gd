extends Ability

func _init() -> void:
	ability_name = "Bon Appetit!"
	ability_type = "area_attack"
	ability_shape = "cylinder"
	targeting_type = "self"
	duration = 0.1
	heal_amount = 40.0
	cast_time = 4.0
	enemy_status_effect_afflictions = ["Regeneration"]
	targets_enemies = false
	targets_allies = true
	size = Vector3(8,.35, 8)
