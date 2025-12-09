extends Ability

func _init() -> void:
	ability_name = "Let's Celebrate!"
	ability_type = "area_attack"
	ability_shape = "cylinder"
	ability_description = "Taunt all nearby enemies and gain \nthe Thorns status effect. Taunted forces \nunits to Attack the Piñata. Thorns causes the \nPiñata to reflect a small portion of damage dealt to it from Attacks."
	damage = 0.0
	duration = 0.2
	tick_time = 0.15
	cast_time = 2.0
	enemy_status_effect_afflictions = ["Taunted"]
	self_status_effect_afflictions = ["Thorns"]
	targets_enemies = true
	targets_allies = false
	size = Vector3(5,1,5)
