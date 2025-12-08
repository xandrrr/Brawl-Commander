class_name GamePhase extends Node3D

var game_match : GameMatch

signal phase_finished

func run():
	pass


func on_enter():
	pass


func on_finish():
	pass


func set_up(session : GameMatch):
	game_match = session
