class_name GameMatch extends Node3D

const GAME_PHASES_PATH = "res://Elements/GamePhases/"

@export var hero_manager : HeroManager
var game_resource_manager : GameResourceManager

var teams : Array = []
var player_team : Team = null

var current_phase_number : int = 0
var current_phase : GamePhase = null
var game_phase_dictionary : Dictionary

var match_over : bool = false

var test_teams : Array = [
	"Player",
	"Enemy",
	"Enemy2",
	"Enemy3"
]

var test_selections : Dictionary = {
	"Player" : ["TestUnit5"],
	"Enemy" : ["TestUnit6"],
	"Enemy2" : ["TestUnit3"],
	"Enemy3" : ["TestUnit8"]
}

var test_game_phase_order : Dictionary = {
	1 : "BattlePhase"
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_phase_dictionary = test_game_phase_order
	play_next_game_phase()


func populate_teams_for_new_game():
	for team in test_teams:
		var new_team = load("res://Scripts/team.gd").new(team)
		teams.append(new_team)
		new_team.status = "In-Game"


func get_team(team_name : String):
	for team in teams:
		if team.team_name == team_name:
			return team_name


func get_remaining_teams():
	var remaining_teams = []
	for team in teams:
		if team.status == "In-Game":
			remaining_teams.append(team)
	
	return remaining_teams


#For loading the next event
func load_game_phase(phase_name : String):
	var phase = load("res://Elements/GamePhases/" + phase_name + "/" + phase_name + ".tscn")
	var phase_node = phase.instantiate()
	phase_node.set_up(self)
	add_child(phase_node)
	return phase_node


func play_next_game_phase():
	#increment phase number
	current_phase_number += 1
	if current_phase_number > game_phase_dictionary.size():
		current_phase_number = 1
	
	var next_game_phase = load_game_phase(game_phase_dictionary[current_phase_number])
	next_game_phase.run()


func clear_map():
	for child in get_node("Map").get_children():
		child.queue_free()
