extends StatusEffect

func activate():
	status_name = "Stun"
	max_stacks = 1
	current_stacks = 1
	refresh_on_stack_added = true
	is_indefinite = false
	blocks_attack = true
	blocks_cast = true
	blocks_target_update = true
	
	$DurationTimer.wait_time = duration
	$DurationTimer.start()

func on_added():
	var old_movement_speed = affected_unit.get_stat("stats", "movement_speed")
	var new_movement_speed = 0.0
	var movement_speed_difference = new_movement_speed - old_movement_speed
	
	affected_unit.modify_stat("stats","movement_speed",movement_speed_difference)
	
	modified_stats["movement_speed"] = movement_speed_difference
