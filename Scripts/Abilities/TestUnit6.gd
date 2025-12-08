extends Ability

func _init() -> void:
	ability_name = "Bleed Enemy"
	ability_type = "targetable"
	targeting_type = "nearest_enemy"
	enemy_status_effect_afflictions = ["Bleed"]
