extends StatusEffect

func activate():
	status_name = "Overclocked"
	max_stacks = 1
	current_stacks = 1
	refresh_on_stack_added = true
	duration = 10.0
	is_indefinite = false
	blocks_attack = false
	blocks_cast = false
	blocks_target_update = true
	
	$DurationTimer.wait_time = duration
	$DurationTimer.start()


func on_added():
	var old_attack_damage = affected_unit.get_stat("stats", "attack_damage")
	var old_attack_speed = affected_unit.get_stat("stats", "attack_speed")
	
	var new_attack_damage = old_attack_damage * 1.25
	var new_attack_speed = old_attack_speed * 1.25
	
	var attack_damage_difference = new_attack_damage - old_attack_damage
	var attack_speed_difference = new_attack_speed - old_attack_speed
	
	affected_unit.modify_stat("stats","attack_damage",attack_damage_difference)
	affected_unit.modify_stat("stats","attack_speed",attack_speed_difference)
	
	modified_stats["attack_damage"] = attack_damage_difference
	modified_stats["attack_speed"] = attack_speed_difference
