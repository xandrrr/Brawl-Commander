extends GamePhase

func run():
	var hero_manager = game_match.hero_manager
	var player_party = game_match.player_team.party
	
	for party in game_match.hero_manager.parties:
		for hero in party.heroes:
			hero.level +=1
	
	var hero_level_up_screen = load("res://Elements/GamePhases/LevelHeroes/hero_level_up_screen.tscn")
	var level_up_node = hero_level_up_screen.instantiate()
	add_child(level_up_node)
	
	level_up_node.create_templates_for_party(player_party)
	
	level_up_node.get_node("ConfirmButton").pressed.connect(func():
		#level up selected hero
		if level_up_node.selection:
			var selected_hero = player_party.get_hero(level_up_node.selection)
			if selected_hero:
				selected_hero.level += 1
				
				#level up all teams' heroes and add an extra level to a random hero for each enemy team
				#to simulate enemies making a decision
				for party in game_match.hero_manager.parties:
					if party != player_party:
						var random_int = randi_range(0,3)
						var random_hero = party.heroes[random_int]
						random_hero.level +=1
				
				phase_finished.emit()
	)
