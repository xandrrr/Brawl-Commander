extends State

func enter(previous_state_path: String, data := {}) -> void:
	data["unit"].queue_free()
