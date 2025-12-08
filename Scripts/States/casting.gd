extends State


var current_unit : Unit


func enter(previous_state_path: String, data := {}) -> void:
	#set current_unit if not set
	if current_unit == null: 
		current_unit = data["unit"]
