extends GamePhase

func run():
	var hero_manager = game_match.hero_manager
		
	game_match.populate_teams_for_new_game()
	hero_manager.create_party_for_all_teams(game_match.teams)
	
	var new_battle = load("res://Elements/GamePhases/BattlePhase/battle.tscn")
	var new_battle_node = new_battle.instantiate()
	add_child(new_battle_node)
	
	game_match.hero_manager.populate_new_hero_pool()
	var selections = game_match.test_selections
	var teams = game_match.teams
	
	for i in range(teams.size()):
		for hero_name in selections[teams[i].team_name]:
			var hero_selection = hero_manager.get_hero_by_name(hero_name)
			hero_manager.move_hero_to_party(hero_selection, game_match.teams[i].party)
		
	new_battle_node.setup_battle_with_parties(hero_manager.parties)
	new_battle_node.start_battle()
