extends StatusEffect

func activate():
	status_name = "Safeguard"
	max_stacks = 1
	current_stacks = 1
	refresh_on_stack_added = true
	duration = 4
	blocks_attack = false
	blocks_cast = false
	blocks_target_update = false
	
	$DurationTimer.wait_time = duration
	$DurationTimer.start()


func on_unit_damaged(damage : float, attacker : Unit):
	var threshold = affected_unit.get_stat("stats","max_health") * 0.3
	if affected_unit.current_health < threshold:
		affected_unit.heal(damage)
