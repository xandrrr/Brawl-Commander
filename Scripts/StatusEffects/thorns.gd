extends StatusEffect

func activate():
	status_name = "Thorns"
	max_stacks = 1
	current_stacks = 1
	refresh_on_stack_added = true
	
	$DurationTimer.wait_time = duration
	$DurationTimer.start()


func on_unit_damaged(damage : float, attacker : Unit):
	var reflect_damage = damage * .15
	inflictor.take_damage(reflect_damage, affected_unit)
