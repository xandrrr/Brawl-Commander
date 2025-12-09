extends StatusEffect

func activate():
	status_name = "Taunted"
	max_stacks = 1
	current_stacks = 1
	duration = 3.0
	tick_timer = 0.2
	refresh_on_stack_added = true
	is_indefinite = false
	blocks_attack = false
	blocks_cast = true
	blocks_target_update = true
	
	$DurationTimer.wait_time = duration
	$DurationTimer.start()
	
	$TickTimer.wait_time = tick_timer
	$TickTimer.start()
	
	on_added()


func on_added():
	if !inflictor.unit_is_defeated:
		affected_unit.update_target(inflictor)


func pulse():
	if !inflictor.unit_is_defeated:
		affected_unit.update_target(inflictor)
