extends StatusEffect

func activate():
	status_name = "Poison"
	max_stacks = 3
	current_stacks = 1
	refresh_on_stack_added = true
	duration = 6
	is_indefinite = false
	blocks_attack = false
	blocks_cast = false
	blocks_target_update = false
	tick_timer = 1.0
	
	$DurationTimer.wait_time = duration
	$DurationTimer.start()
	
	$TickTimer.wait_time = tick_timer
	$TickTimer.start()


func pulse():
	var tick_damage = inflictor.get_stat("stats","ability_power") * 0.05 * current_stacks
	affected_unit.take_damage(tick_damage, inflictor)
