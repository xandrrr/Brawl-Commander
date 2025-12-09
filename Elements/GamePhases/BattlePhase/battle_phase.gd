extends GamePhase

func run():
	var hero_manager = game_match.hero_manager
	
	var new_battle = load("res://Elements/GamePhases/BattlePhase/battle.tscn")
	var new_battle_node = new_battle.instantiate()
	add_child(new_battle_node)
	
	
	new_battle_node.setup_battle_with_parties(hero_manager.parties)
	new_battle_node.start_battle()
	
	new_battle_node.battle_finished.connect(func(winner : Team):
		var winning_team = game_match.get_team(winner.team_name)
		winning_team.points += 1
		phase_finished.emit()
	)
