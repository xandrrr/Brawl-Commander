extends State

var current_unit : Unit

func physics_update(_delta: float):
	#look at then move to the unit's current target
	if current_unit.current_target: 
		var movement_speed : float = current_unit.get_stat("stats", "movement_speed")
		current_unit.look_at(current_unit.current_target.position)
		current_unit.velocity = -current_unit.transform.basis.z * movement_speed * _delta
		current_unit.move_and_slide()


func enter(previous_state_path: String, data := {}) -> void:
	if current_unit == null:
		current_unit = data["unit"]
	if current_unit.units_in_attack_range.size() == 0:
		var closest_enemy = current_unit.get_closest_enemy_unit()
		current_unit.update_target(closest_enemy)
		
		current_unit.get_node("AttackRange").scale = Vector3(1,1,1) * current_unit.get_stat("config", "attack_range")
	else:
		self.finished.emit("Attacking", {"unit" : current_unit})
