class_name GameMatch extends Node3D

const GAME_PHASES_PATH = "res://Elements/GamePhases/"

@export var hero_manager : HeroManager
var game_resource_manager : GameResourceManager

var teams : Array = []
var player_team : Team

var current_phase_number : int = 0
var current_phase : GamePhase
var game_phase_dictionary : Dictionary

var match_over : bool = false

var starting_team_names : Array = [
	"You",
	"Enemy 1",
	"Enemy 2",
	"Enemy 3"
]

var selections : Dictionary = {
	"You" : ["Wizard"],
	"Enemy 1" : ["Bunny"],
	"Enemy 2" : ["Skeleton"],
	"Enemy 3" : ["Werewolf"]
}

var game_phase_order : Dictionary = {
	1 : "LevelHeroes",
	2 : "BattlePhase",
	3 : "TeamStandings"
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	populate_teams_for_new_game()
	hero_manager.create_party_for_all_teams(teams)
	
	hero_manager.populate_new_hero_pool()
	game_phase_dictionary = game_phase_order
	current_phase = load_game_phase("HeroSelect")
	current_phase.run()
	current_phase.phase_finished.connect(func():
		current_phase.queue_free()
		play_next_game_phase()
	)

func populate_teams_for_new_game():
	for team in starting_team_names:
		var new_team = load("res://Scripts/team.gd").new(team)
		teams.append(new_team)
		if team == "You":
			player_team = new_team


func get_team(team_name : String):
	for team in teams:
		if team.team_name == team_name:
			return team


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
	
	current_phase = load_game_phase(game_phase_dictionary[current_phase_number])
	current_phase.run()
	current_phase.phase_finished.connect(func():
		current_phase.queue_free()
		play_next_game_phase()
	)


func clear_map():
	for child in get_node("Map").get_children():
		child.queue_free()


func check_for_winner():
	for team in teams:
		if team.points == 2:
			declare_winner(team)


func declare_winner(team : Team):
	pass
