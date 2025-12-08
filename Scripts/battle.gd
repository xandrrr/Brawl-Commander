class_name Battle extends Node3D

const SPAWN_SET = preload("res://Elements/spawn_set.tscn")

@export var unit_manager : UnitManager
@export var SpawnHolder : Node3D
var active_units_in_battle : Array = []
var defeated_units : Array = []

signal battle_started
signal battle_finished(winner : Team)

func _ready() -> void:
	add_to_group("Battle")


func setup_battle_with_parties(parties : Array):
	for party in parties:
		unit_manager.add_units_from_party(party)
	
	create_unit_spawns(parties.size())
	move_units_to_spawns(parties)


func start_battle():
	unit_manager.activate_units(active_units_in_battle)


func create_unit_spawns(amount : int):
	const DISTANCE_FROM_CENTER = 20
	var separation_degrees = 360.0 / amount
	var radians_elapsed = 0
	
	#Create spawns and arrange them in a circle, evenly spaced from one another
	for i in range(amount):
		var new_spawns = SPAWN_SET.instantiate()
		get_node("SpawnHolder").add_child(new_spawns)
		new_spawns.global_position = get_node("SpawnCenter").global_position
		new_spawns.global_position.x += (sin(radians_elapsed) * DISTANCE_FROM_CENTER)
		new_spawns.global_position.z += (cos(radians_elapsed) * DISTANCE_FROM_CENTER)
		new_spawns.look_at(get_node("SpawnCenter").global_position)
		new_spawns.transform.basis = new_spawns.transform.basis.rotated(Vector3.UP, PI/2)
		
		radians_elapsed += deg_to_rad(separation_degrees)


func move_units_to_spawns(parties : Array):
	var available_spawns = get_node("SpawnHolder").get_children()
	
	for party in parties:
		var ran_num = randi_range(0, (available_spawns.size() - 1))
		var random_spawn_set = available_spawns[ran_num]
		var party_units = unit_manager.parse_units_in_team(active_units_in_battle, party.parent_team)
		random_spawn_set.seat_units(party_units)
		available_spawns.erase(random_spawn_set)


func check_for_winner():
	var battle_is_active : bool = false
	var most_recently_checked_team : Team = active_units_in_battle[0].team
	for unit in active_units_in_battle:
		if unit.team != most_recently_checked_team:
			battle_is_active = true
			break
	
	if not battle_is_active:
		declare_winner(most_recently_checked_team)


func declare_winner(team : Team):
	battle_finished.emit(team)


func _on_unit_manager_unit_died(unit: Unit) -> void:
	defeated_units.append(unit)
	active_units_in_battle.erase(unit)
	unit_manager.remove_unit_from_attack_ranges(active_units_in_battle, unit)
	var active_skills = $Skills.get_children()
	for skill in active_skills:
		if skill.caster == unit:
			skill.queue_free()
	
	check_for_winner()


func _on_unit_manager_unit_added(unit: Unit) -> void:
	active_units_in_battle.append(unit)
