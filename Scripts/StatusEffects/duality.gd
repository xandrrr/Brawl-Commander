extends StatusEffect

func activate():
	status_name = "Duality"
	max_stacks = 1
	current_stacks = 1
	refresh_on_stack_added = true
	duration = 5.0
	is_indefinite = false
	blocks_attack = false
	blocks_cast = false
	blocks_target_update = false
	
	$DurationTimer.wait_time = duration
	$DurationTimer.start()


func on_hit(damage : float, target : Unit):
	var extra_damage = affected_unit.get_stat("stats","ability_power") * 0.5
	target.take_damage(extra_damage, inflictor)
