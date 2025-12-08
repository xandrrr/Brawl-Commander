extends State

func enter(previous_state_path: String, data := {}) -> void:
	data["unit"].unit_is_defeated = true
	data["unit"].visible = false
