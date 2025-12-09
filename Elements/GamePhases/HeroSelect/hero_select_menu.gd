extends Control

const ABILITIES_PATH = "res://Scripts/Abilities/"

@export var parties = {}
@export var team_panels = {}
@export var all_heroes = {}
@export var available_heroes = {}
@export var item_list : ItemList
@export var hero_information_hbox : HBoxContainer
@export var hovered_hero_name : String

signal hero_select_finished

func create_team_panels(teams : Array):
	var team_panel = load("res://Elements/GamePhases/HeroSelect/team_information_panel.tscn")
	for team in teams:
		parties[team.team_name] = []
		
		var team_panel_node = team_panel.instantiate()
		$TeamGridDisplay.add_child(team_panel_node)
		team_panels[team.team_name] = team_panel_node
		
		team_panel_node.get_node("TeamInformationVBox").get_node("TeamName").text = team.team_name


func populate_hero_list(heroes : Dictionary):
	for hero in heroes:
		item_list.add_item(hero)
		all_heroes[hero] = heroes[hero]
		available_heroes[hero] = heroes[hero]


func update_hero_information(hero_name : String, disable_select_button : bool):
	var hero = all_heroes[hero_name]
	var v_box = $FullHeroProfileHBox.get_node("HeroProfileVBox")
	var headers = v_box.get_node("HeadersVBox")
	var hero_information = v_box.get_node("HeroInformationHBox")
	
	v_box.get_node("ConfirmSelection").visible = !disable_select_button
	if !disable_select_button:
		hovered_hero_name = hero_name
	else:
		hovered_hero_name = ""
	
	#set header
	headers.get_node("HeroName").text = hero.hero_name
	
	#set stat information
	var current_stats = hero_information.get_node("CurrentStatsVBox")
	var growth_stats = hero_information.get_node("GrowthVBox")
	
	for stat in hero.stats.stats_dictionary["stats"]:
		var label = current_stats.get_node(stat)
		
		var base_stat_value = hero.stats.stats_dictionary["stats"][stat]
		var base_growth = hero.stats.stats_dictionary["growth"][stat]
		label.text = str(base_stat_value)
		
		var growth_label = growth_stats.get_node(stat)
		growth_label.text = "( + " + str(base_growth) + " )"
	
	#set ability information
	var ability_information = hero_information.get_node("AbilityInformationVBox")
	
	var ability_path = ABILITIES_PATH + hero.hero_name + ".gd"
		
	if FileAccess.file_exists(ability_path):
		var ability = load(ability_path).new()
		ability_information.get_node("AbilityName").text = ability.ability_name
		ability_information.get_node("AbilityDescription").text = ability.ability_description


func add_hero_to_party(hero_name : String, party_name : String):
	var hero_hbox = load("res://Elements/GamePhases/HeroSelect/hero_hbox.tscn")
	var hero_hbox_node = hero_hbox.instantiate()
	var team_information_vbox = team_panels[party_name].get_node("TeamInformationVBox")
	var hero_selections_vbox = team_information_vbox.get_node("HeroSelectionsVBox")
	hero_selections_vbox.add_child(hero_hbox_node)
	
	for i in range(item_list.item_count):
		if item_list.get_item_text(i) == hero_name:
			item_list.remove_item(i)
			break
	
	hero_hbox_node.get_node("HeroName").text = hero_name
	hero_hbox_node.get_node("ViewHeroButton").pressed.connect(func():
		update_hero_information(hero_name, true)
	)
	
	parties[party_name].append(available_heroes[hero_name])
	available_heroes.erase(hero_name)


func _on_item_list_item_selected(index: int) -> void:
	var hero_name = item_list.get_item_text(index)
	update_hero_information(hero_name, false)


func _on_confirm_selection_pressed() -> void:
	for hero in available_heroes:
		if hero == hovered_hero_name:
			add_hero_to_party(hovered_hero_name, "You")
	
	for party in parties:
		if party != "You":
			var random_int = randi_range(0, (available_heroes.size() - 1))
			var random_hero_name = available_heroes.keys()[random_int]
			add_hero_to_party(random_hero_name, party)
	
	if parties["You"].size() == 4:
		hero_select_finished.emit()
