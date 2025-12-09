extends StatusEffect

func activate():
	status_name = "Vulnerable"
	max_stacks = 3
	current_stacks = 1
	refresh_on_stack_added = true
	duration = 8.0
	
	$DurationTimer.wait_time = duration
	$DurationTimer.start()


func on_unit_damaged(damage_taken : float, _attacker : Unit):
	var extra_damage = damage_taken * .1 * current_stacks
	affected_unit.take_damage_without_effects(extra_damage, inflictor)
