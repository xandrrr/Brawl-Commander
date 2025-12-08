extends StatusEffect

func activate():
	status_name = "Silenced"
	max_stacks = 1
	current_stacks = 1
	duration = 2.0
	refresh_on_stack_added = true
	is_indefinite = false
	blocks_attack = false
	blocks_cast = true
	blocks_target_update = false
	
	$DurationTimer.wait_time = duration
	$DurationTimer.start()
