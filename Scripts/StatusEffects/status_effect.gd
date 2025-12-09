class_name StatusEffect extends Node3D

var status_name : String
var affected_unit : Unit
var inflictor : Unit

var max_stacks : int
var current_stacks : int
var refresh_on_stack_added : bool

var duration : float
var is_indefinite : bool

var damage : float
var healing : float
var blocks_attack : bool
var blocks_cast : bool
var blocks_target_update : bool
var blocks_heal : bool

var modified_stats : Dictionary

var tick_timer : float = 999.0

signal finished


func add_stack():
	#don't let current_stacks exceed max_stacks
	current_stacks = min((current_stacks + 1), max_stacks)
	
	on_stack_added()
	
	#refresh duration of status effect if refresh_on_stack_added is true
	if refresh_on_stack_added:
		$DurationTimer.start()


func activate():
	pass


func remove_stacks(num_stacks : int):
	current_stacks -= num_stacks
	if current_stacks <= 0:
		cleanse()

#these functions handle status effect logic
func on_added():
	pass


func on_stack_added():
	pass


func on_hit(damage_dealt : float, target : Unit):
	pass


func on_unit_damaged(damage_taken : float, attacker : Unit):
	pass


func on_removed():
	pass


func pulse():
	print("pulse: ", status_name)
	pass


#cleanup function
func cleanse():
	for stat in modified_stats:
		affected_unit.modify_stat("stats", stat, -modified_stats[stat])
	
	finished.emit()
	affected_unit.status_effects.erase(status_name)
	queue_free()


func _on_duration_timer_timeout() -> void:
	on_removed()
	cleanse()


func _on_tick_timer_timeout() -> void:
	pulse()
