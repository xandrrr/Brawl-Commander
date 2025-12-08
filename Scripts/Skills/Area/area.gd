class_name AreaSkill extends Area3D

var caster : Unit

var damage : float
var heal_amount : float
var tick_time : float
var duration : float
var size : Vector3

var can_hit_enemies : bool
var enemy_status_afflictions : Array = []
var can_hit_allies : bool
var ally_status_afflictions : Array = []

var target : Unit
var units_in_range : Array = []

func _ready() -> void:
	self.global_position = target.global_position


func _process(delta: float) -> void:
	duration -= delta
	if duration <= 0:
		queue_free()


func _on_tick_timer_timeout() -> void:
	pulse()


func start_tick_timer():
	$TickTimer.wait_time = tick_time
	$TickTimer.start()


func pulse():
	var valid_units = units_in_range.filter(is_instance_valid)

	for unit in valid_units:
		if unit.team != caster.team:
			on_enemy_hit(unit)
		else:
			on_ally_hit(unit)


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Units"):
		units_in_range.append(body)


func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("Units"):
		units_in_range.erase(body)


func on_enemy_hit(enemy : Unit):
	enemy.take_damage(damage, caster)
	for status_effect in enemy_status_afflictions:
		enemy.status_effect_gained.emit(status_effect)


func on_ally_hit(ally : Unit):
	ally.heal(heal_amount)
	for status_effect in ally_status_afflictions:
		ally.status_effect_gained.emit(status_effect)
