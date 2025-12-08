extends StatusEffect

func activate():
	status_name = "Stun"
	max_stacks = 1
	current_stacks = 1
	refresh_on_stack_added = true
	is_indefinite = false
	blocks_attack = true
	blocks_cast = true
	blocks_target_update = true
	
	$DurationTimer.wait_time = duration
	$DurationTimer.start()
