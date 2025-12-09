extends Ability

func _init() -> void:
	ability_name = "A Christmas Miracle"
	ability_type = "dash"
	targeting_type = "random_enemy"
	ability_description = "Dash to the nearest enemy, damaging them \nand applying Stun and Silenced. Silenced \nprevents units from casting their ability."
	damage = 20.0
	enemy_status_effect_afflictions = ["Stunned", "Silenced"]
	duration = 1.0
	cast_time = 0.1
	targets_enemies = true
	global = true
