extends CharacterBody3D

const CAMERA_SPEED = 1000.0

func _process(delta: float) -> void:
	velocity.x = Input.get_axis("left","right") * CAMERA_SPEED * delta
	velocity.y = Input.get_axis("in","out") * CAMERA_SPEED * delta
	velocity.z = Input.get_axis("up","down") * CAMERA_SPEED * delta
	
	move_and_slide()
