extends GamePhase

func run():
	game_match.get_node("Song3").play()
	
	var hero_select_menu = load("res://Elements/GamePhases/HeroSelect/hero_select_menu.tscn")
	var hero_select_menu_node = hero_select_menu.instantiate()
	add_child(hero_select_menu_node)
	
	hero_select_menu_node.create_team_panels(game_match.teams)
	hero_select_menu_node.populate_hero_list(game_match.hero_manager.hero_pool)
	
	hero_select_menu_node.hero_select_finished.connect(func():
		for party in hero_select_menu_node.parties:
			for hero in hero_select_menu_node.parties[party]:
				var matching_team = game_match.get_team(party)
				game_match.hero_manager.move_hero_to_party(hero, matching_team.party)
		
		phase_finished.emit()
	)
