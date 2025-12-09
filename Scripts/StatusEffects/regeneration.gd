extends StatusEffect

func activate():
	status_name = "Regeneration"
	max_stacks = 3
	current_stacks = 1
	duration = 5.0
	refresh_on_stack_added = true
	is_indefinite = false
	blocks_attack = false
	blocks_cast = false
	blocks_target_update = false
	tick_timer = 1.0
	
	healing = inflictor.get_stat("stats","ability_power") * .2
	
	$DurationTimer.wait_time = duration
	$DurationTimer.start()
	
	$TickTimer.wait_time = tick_timer
	$TickTimer.start()


func pulse():
	affected_unit.heal(healing)
