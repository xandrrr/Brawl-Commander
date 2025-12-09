extends Control

@export var selection : String
@export var hero_templates : Dictionary = {}

func create_template_for_hero(hero : Hero):
	var template = load("res://Elements/GamePhases/LevelHeroes/hero_container_template.tscn")
	var new_template = template.instantiate()
	hero_templates[hero.hero_name] = new_template
	$HeroesHBox.add_child(new_template)
	
	var v_box = new_template.get_node("VBox")
	var stats_box = v_box.get_node("StatsHBox")
	var current_stats = stats_box.get_node("CurrentStatsVBox")
	var growth_stats = stats_box.get_node("GrowthVBox")
	
	v_box.get_node("HeroName").text = hero.hero_name
	v_box.get_node("CurrentLevel").text = "Level " + str(hero.level)
	
	for stat in hero.stats.stats_dictionary["stats"]:
		var label = current_stats.get_node(stat)
		
		var base_stat_value = hero.stats.stats_dictionary["stats"][stat]
		var base_growth = hero.stats.stats_dictionary["growth"][stat]
		var total_stat_growth = base_growth * hero.level
		var modified_stat_value = base_stat_value + total_stat_growth
		label.text += str(modified_stat_value)
		
		var growth_label = growth_stats.get_node(stat)
		growth_label.text = "( + " + str(base_growth) + " )"
	
	v_box.get_node("SelectButton").pressed.connect(func():
		change_selection(hero.hero_name)
	)
	
	v_box.get_node("ViewAbilityButton").pressed.connect(func():
		display_ability(hero.hero_name)
	)


func create_templates_for_party(party : Party):
	for hero in party.heroes:
		create_template_for_hero(hero)


func change_selection(hero_name : String):
	if selection != hero_name:
		selection = hero_name
		for hero_template_name in hero_templates:
			var v_box = hero_templates[hero_template_name].get_node("VBox")
			var hero_name_text = v_box.get_node("HeroName")
			if hero_template_name == hero_name:
				hero_name_text.set("theme_override_colors/font_color", Color(0.0,1.0,0.0,1.0))
			else:
				hero_name_text.set("theme_override_colors/font_color", Color(1.0,1.0,1.0,1.0))
	else:
		selection = ""
		for hero_template_name in hero_templates:
			var v_box = hero_templates[hero_template_name].get_node("VBox")
			var hero_name_text = v_box.get_node("HeroName")
			hero_name_text.set("theme_override_colors/font_color", Color(1.0,1.0,1.0,1.0))


func display_ability(hero_name : String):
	#hide everything except ability description
	$HeroesHBox.visible = false
	$ConfirmButton.visible = false
	$AbilityDescription.visible = true


func _on_exit_button_pressed() -> void:
	$HeroesHBox.visible = true
	$ConfirmButton.visible = true
	$AbilityDescription.visible = false
