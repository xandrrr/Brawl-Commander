extends StatusEffect

func activate():
	status_name = "Disarmed"
	max_stacks = 1
	current_stacks = 1
	refresh_on_stack_added = true
	is_indefinite = false
	blocks_attack = true
	blocks_cast = false
	blocks_target_update = false
	
	$DurationTimer.wait_time = duration
	$DurationTimer.start()
