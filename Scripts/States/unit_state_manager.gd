extends StateManager


func _on_unit_activated() -> void:
	_transition_to_next_state("FindEnemy", {"unit" : get_parent()})


func _on_unit_enemy_in_attack_range() -> void:
	if state != get_node("Attacking") and get_parent().can_attack:
		_transition_to_next_state("Attacking", {"unit" : get_parent()})


func _on_unit_defeated(attacker : Unit) -> void:
	_transition_to_next_state("Defeated", {"unit" : get_parent(), "attacker" : attacker})


#ability casting
func _on_unit_ability_cast_started() -> void:
	_transition_to_next_state("Casting", {"unit" : get_parent()})


func _on_unit_ability_cast_finished() -> void:
	_transition_to_next_state("Cooldown", {"unit" : get_parent()})
