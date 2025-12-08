extends State

var current_unit : Unit


func physics_update(_delta: float):
	if current_unit.can_attack() and current_unit.units_in_attack_range.size() > 0:
		current_unit.update_target_to_closest_enemy()
		attack_target()
		self.finished.emit("Cooldown", {"unit" : current_unit})


func enter(previous_state_path: String, data := {}) -> void:
	#set current_unit if not set
	if current_unit == null: 
		current_unit = data["unit"]


func attack_target():
	var target : Unit = current_unit.current_target
	if target and target.current_health > 0.0:
		var damage_amount = current_unit.get_stat("stats","attack_damage")
		var attack_timer = current_unit.get_node("AttackTimer")
		
		current_unit.attack_on_cooldown = true
		attack_timer.wait_time = (1 / current_unit.get_stat("stats", "attack_speed"))
		attack_timer.start()
		current_unit.get_node("AttackAnimationPlayer").play("attack")
		
		target.take_damage(damage_amount, current_unit)
		
		for effect in current_unit.status_effects:
			current_unit.status_effects[effect].on_hit(damage_amount, target)
