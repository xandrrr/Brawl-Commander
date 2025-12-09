extends StatusEffect

func activate():
	status_name = "Charted"
	max_stacks = 1
	current_stacks = 1
	refresh_on_stack_added = true
	duration = 6.0
	is_indefinite = false
	blocks_attack = false
	blocks_cast = false
	blocks_target_update = false
	
	$DurationTimer.wait_time = duration
	$DurationTimer.start()
	
	$TickTimer.wait_time = tick_timer
	$TickTimer.start()
	
	on_added()


func on_added():
	var old_attack_damage = affected_unit.get_stat("stats", "attack_damage")
	var old_ability_power = affected_unit.get_stat("stats", "ability_power")
	
	var new_attack_damage = old_attack_damage * .8
	var new_ability_power = old_ability_power * .8
	
	var attack_damage_difference = new_attack_damage - old_attack_damage
	var ability_power_difference = new_ability_power - old_ability_power
	
	affected_unit.modify_stat("stats","attack_damage",attack_damage_difference)
	affected_unit.modify_stat("stats","ability_power",ability_power_difference)
	
	modified_stats["attack_damage"] = attack_damage_difference
	modified_stats["ability_power"] = ability_power_difference
