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
var hi : String

var tick_timer : float = 999.0

signal finished


func add_stacks(num_stacks : int):
	#don't let current_stacks exceed max_stacks
	current_stacks = min((current_stacks + num_stacks), max_stacks)
	
	#refresh duration of status effect if refresh_on_stack_added is true
	if refresh_on_stack_added:
		$DurationTimer.start()


func activate():
	$DurationTimer.wait_time = duration
	$DurationTimer.start()
	
	$TickTimer.wait_time = tick_timer
	$TickTimer.start()

func remove_stacks(num_stacks : int):
	current_stacks -= num_stacks
	if current_stacks <= 0:
		cleanse()

#these functions handle status effect logic
func on_added():
	pass


func on_stack_added():
	pass


func on_hit(damage : float):
	pass


func on_unit_damaged(damage : float):
	pass


func on_removed():
	pass


func pulse():
	pass


#cleanup function
func cleanse():
	on_removed()
	finished.emit()
	queue_free()


func _on_duration_timer_timeout() -> void:
	cleanse()


func _on_tick_timer_timeout() -> void:
	pulse()
