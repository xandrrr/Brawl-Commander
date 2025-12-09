extends GamePhase

func run():
	game_match.get_node("Song2").stop()
	game_match.get_node("Song3").play()
	
	var team_standings_menu = load("res://Elements/GamePhases/TeamStandings/team_standings_menu.tscn")
	var team_standings_menu_node = team_standings_menu.instantiate()
	add_child(team_standings_menu_node)
	
	team_standings_menu_node.populate_team_grid(game_match.teams)
	
	team_standings_menu_node.get_node("ConfirmButton").pressed.connect(func():
		game_match.check_for_winner()
		phase_finished.emit()
	)
