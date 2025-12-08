extends State

var current_unit : Unit


func physics_update(_delta: float):
	if current_unit.can_attack():
		self.finished.emit("FindEnemy", {"unit" : self})


func enter(previous_state_path: String, data := {}) -> void:
	#set current_unit if not set
	if current_unit == null: 
		current_unit = data["unit"]
