extends StatusEffect

func activate():
	status_name = "Check"
	max_stacks = 3
	current_stacks = 1
	refresh_on_stack_added = true
	duration = 30.0
	is_indefinite = false
	blocks_attack = false
	blocks_cast = false
	blocks_target_update = false
	
	$DurationTimer.wait_time = duration
	$DurationTimer.start()


func on_stack_added():
	var stun = affected_unit.add_status_effect("Stunned", inflictor)
	stun.duration = current_stacks
	stun.get_node("DurationTimer").start()
	
	if current_stacks == max_stacks:
		var damage = inflictor.get_stat("stats","max_health") * .15
		affected_unit.take_damage(damage, inflictor)
		
		cleanse()
