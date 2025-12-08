extends StatusEffect

func activate():
	status_name = "Antiheal"
	max_stacks = 1
	current_stacks = 1
	duration = 8.0
	refresh_on_stack_added = true
	is_indefinite = false
	blocks_attack = false
	blocks_cast = false
	blocks_target_update = false
	blocks_heal = true
	
	$DurationTimer.wait_time = duration
	$DurationTimer.start()
