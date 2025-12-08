extends Node3D


func seat_units(units : Array):
	if units.size() < 5:
		for i in range (units.size()):
			var spawn_path : String = "Spawn"
			spawn_path += str(i)
			units[i].global_position = get_node(spawn_path).global_position
	else: 
		push_warning("Cannot seat over 4 units.")
