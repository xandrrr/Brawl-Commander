extends StatusEffect

func activate():
	status_name = "Thorns"
	duration = 5.0
	max_stacks = 1
	current_stacks = 1
	refresh_on_stack_added = true
	
	$DurationTimer.wait_time = duration
	$DurationTimer.start()


func on_unit_damaged(damage : float, attacker : Unit):
	var reflect_damage = damage * .15
	attacker.take_damage(reflect_damage, affected_unit)
