extends StatusEffect

func activate():
	status_name = "Taunted"
	max_stacks = 1
	current_stacks = 1
	duration = 3.0
	refresh_on_stack_added = true
	is_indefinite = false
	blocks_attack = false
	blocks_cast = true
	blocks_target_update = true
	
	$DurationTimer.wait_time = duration
	$DurationTimer.start()


func on_added():
	if !inflictor.unit_is_defeated:
		affected_unit.update_target(inflictor)
