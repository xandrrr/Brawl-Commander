extends StatusEffect

func activate():
	status_name = "Lifesteal"
	max_stacks = 3
	current_stacks = 1
	refresh_on_stack_added = true
	duration = 8.0
	is_indefinite = false
	blocks_attack = false
	blocks_cast = false
	blocks_target_update = false
	
	$DurationTimer.wait_time = duration
	$DurationTimer.start()


func on_hit(damage : float, target : Unit):
	var heal_amount = damage * .1 * current_stacks
	affected_unit.heal(heal_amount)
