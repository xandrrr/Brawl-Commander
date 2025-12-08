extends StatusEffect

func activate():
	status_name = "Bleed"
	max_stacks = 5
	current_stacks = 1
	refresh_on_stack_added = true
	duration = 5
	is_indefinite = false
	blocks_attack = false
	blocks_cast = false
	blocks_target_update = false
	tick_timer = 0.5
	
	$DurationTimer.wait_time = duration
	$DurationTimer.start()
	
	$TickTimer.wait_time = tick_timer
	$TickTimer.start()


func pulse():
	var percent_health_damage = affected_unit.get_stat("stats","max_health") * 0.01 * current_stacks
	affected_unit.take_damage(percent_health_damage, inflictor)
