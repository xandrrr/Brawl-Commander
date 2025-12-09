extends Ability

func _init() -> void:
	ability_name = "Overclock"
	ability_type = "targetable"
	targeting_type = "nearest_ally"
	ability_description = "Grant the nearest ally Health Regeneration \nand Overclocked, increasing their Attack \nDamage and Attack Speed for a short time."
	ally_status_effect_afflictions = ["Overclocked", "Regeneration"]
	cast_time = 1.5
	global = true
