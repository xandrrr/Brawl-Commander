extends StatusEffect

func activate():
	status_name = "Bleed"
	max_stacks = 5
	current_stacks = 1
	refresh_on_stack_added = true
	duration = 5.0
	is_indefinite = false
	blocks_attack = false
	blocks_cast = false
	blocks_target_update = false
	tick_timer = 1.0
	damage = affected_unit.get_stat("stats","max_health") * 0.01
	
	$DurationTimer.wait_time = duration
	$DurationTimer.start()
	
	$TickTimer.wait_time = tick_timer
	$TickTimer.start()


func pulse():
	var total_damage = damage * current_stacks
	affected_unit.take_damage(total_damage, inflictor)
