extends Control

const ABILITIES_PATH = "res://Scripts/Abilities/"

@export var hero_profile_panel : Control

func populate_team_grid(teams : Array):
	for team in teams:
		var template = load("res://Elements/GamePhases/TeamStandings/team_display_template.tscn")
		var new_template = template.instantiate()
		$TeamGridContainer.add_child(new_template)
		
		var v_box = new_template.get_node("VBoxContainer")
		var hero_list_hbox = v_box.get_node("HeroListHBox")
		
		v_box.get_node("TeamName").text = team.team_name
		v_box.get_node("TeamPoints").text = "Points: " + str(team.points)
		
		populate_team_heroes(team, hero_list_hbox)


func populate_team_heroes(team : Team, destination : HBoxContainer):
	var party = team.party
	for hero in party.heroes:
		var template = load("res://Elements/GamePhases/TeamStandings/hero_display_template.tscn")
		var new_template = template.instantiate()
		destination.add_child(new_template)
		
		new_template.get_node("HeroName").text = hero.hero_name
		new_template.get_node("HeroLevel").text = "Level " + str(hero.level)
		new_template.get_node("ViewHeroButton").pressed.connect(func():
			display_hero_profile_panel(hero)
		)


func display_hero_profile_panel(hero : Hero):
	#flip visibility of other elements so that only the hero information panel is visible
	$TeamGridContainer.visible = false
	$ConfirmButton.visible = false
	
	var hero_profile_panel = load("res://Elements/GamePhases/TeamStandings/hero_profile_panel.tscn")
	var new_panel = hero_profile_panel.instantiate()
	add_child(new_panel)
	
	var v_box = new_panel.get_node("HeroProfileVBox")
	var headers = v_box.get_node("HeadersVBox")
	var hero_information = v_box.get_node("HeroInformationHBox")
	
	#set headers
	headers.get_node("HeroName").text = hero.hero_name
	headers.get_node("HeroLevel").text = "Level" + str(hero.level)
	headers.get_node("HeroTeam").text = "Belongs to " + hero.party.parent_team.team_name
	
	#set stat information
	var current_stats = hero_information.get_node("CurrentStatsVBox")
	var growth_stats = hero_information.get_node("GrowthVBox")
	
	for stat in hero.stats.stats_dictionary["stats"]:
		var label = current_stats.get_node(stat)
		
		var base_stat_value = hero.stats.stats_dictionary["stats"][stat]
		var base_growth = hero.stats.stats_dictionary["growth"][stat]
		var total_stat_growth = base_growth * hero.level
		var modified_stat_value = base_stat_value + total_stat_growth
		label.text += str(modified_stat_value)
		
		var growth_label = growth_stats.get_node(stat)
		growth_label.text = "( + " + str(base_growth) + " )"
	
	#set ability information
	var ability_information = hero_information.get_node("AbilityInformationVBox")
	
	var ability_path = ABILITIES_PATH + hero.hero_name + ".gd"
		
	if FileAccess.file_exists(ability_path):
		var ability = load(ability_path).new()
		ability_information.get_node("AbilityName").text = ability.ability_name
		ability_information.get_node("AbilityDescription").text = ability.ability_description
	
	#delete panel on exit button click and make other UI elements visible again
	v_box.get_node("ExitHeroDisplayButton").pressed.connect(func():
		$TeamGridContainer.visible = true
		$ConfirmButton.visible = true
		new_panel.queue_free()
	)
