class_name DashSkill extends Node3D

var caster : Unit

var damage : float
var heal_amount : float
var duration : float

var target : Unit
var current_tween : Tween

var can_hit_enemies : bool
var enemy_status_afflictions : Array = []
var can_hit_allies : bool
var ally_status_afflictions : Array = []

var collision_shape : CollisionShape3D

func dash():
	if target:
		var direction = (target.global_position - caster.global_position)
		var normalized_direction = direction.normalized()
		var distance = direction.length()
		var stopping_distance = 3.0
		var dash_distance = max(0, distance - stopping_distance)
		var destination = caster.global_position + (normalized_direction * dash_distance)
		destination.y = caster.global_position.y
		
		current_tween = create_tween()
		current_tween.tween_property(caster, "global_position", destination, duration)
		
		current_tween.finished.connect(func():
			if target.team != caster.team:
				on_enemy_hit(target)
			else:
				on_ally_hit(target)
			queue_free()
		)
	else:
		on_ally_hit(caster)


func on_enemy_hit(enemy : Unit):
	enemy.take_damage(damage, caster)
	for status_effect in enemy_status_afflictions:
		enemy.add_status_effect(status_effect, caster)


func on_ally_hit(ally : Unit):
	ally.heal(heal_amount)
	for status_effect in ally_status_afflictions:
		ally.add_status_effect(status_effect, caster)
