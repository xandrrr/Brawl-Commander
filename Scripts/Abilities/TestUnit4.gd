extends Ability

func _init() -> void:
	ability_name = "Cool Heal"
	ability_type = "targetable"
	targeting_type = "self"
	heal_amount = 20.0
	cast_time = 0.5
	global = false
