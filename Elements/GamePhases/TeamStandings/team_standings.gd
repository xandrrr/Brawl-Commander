extends GamePhase

func run():
	var team_standings_menu = load("res://Elements/GamePhases/TeamStandings/team_standings_menu.tscn")
	var team_standings_menu_node = team_standings_menu.instantiate()
	add_child(team_standings_menu_node)
	
	team_standings_menu_node.populate_team_grid(game_match.teams)
	
	team_standings_menu_node.get_node("ConfirmButton").pressed.connect(func():
		phase_finished.emit()
	)
