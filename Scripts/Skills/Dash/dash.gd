class_name DashSkill extends Node3D

var caster : Unit

var duration : float

var target : Unit
var current_tween : Tween
var interrupt : bool

var collision_shape : CollisionShape3D

func dash():
	var direction = (target.global_position - caster.global_position)
	var normalized_direction = direction.normalized()
	var distance = direction.length()
	var stopping_distance = 3.0
	var dash_distance = max(0, distance - stopping_distance)
	var destination = caster.global_position + (normalized_direction * dash_distance)
	destination.y = caster.global_position.y
	
	current_tween = create_tween()
	current_tween.tween_property(caster, "global_position", destination, duration)


func _process(delta: float) -> void:
	if interrupt or !current_tween.is_running():
		current_tween.kill()
		queue_free()
