extends Ability

func _init() -> void:
	ability_name = "Bestow Sickness"
	ability_type = "projectile"
	targeting_type = "nearest_enemy"
	enemy_status_effect_afflictions = ["Poison"]
	ability_description = "Fire a projectile at the nearest enemy that \napplies Poison. Poison does tick damage equal to a small \nportion of the caster's Ability Power every second."
	speed = 6.0
	damage = 25.0
	size = Vector3(.4,.4,.4)
	cast_time = 0.5
	targets_enemies = true
	targets_allies = false
	global = false
