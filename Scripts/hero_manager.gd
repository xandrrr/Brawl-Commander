class_name HeroManager extends Node

const HERO_DATABASE = preload("res://Assets/Resources/hero_stat_database.tres")
var hero_pool : Dictionary = {}
var parties : Array = []

signal team_eliminated(team : Team)


func create_party_for_team(team : Team):
	var new_party = load("res://Scripts/party.gd").new()
	new_party.party_name = team.team_name
	new_party.parent_team = team
	team.party = new_party
	parties.append(new_party)


func create_party_for_all_teams(teams : Array):
	parties.clear()
	for team in teams:
		create_party_for_team(team)


func get_party_from_name(team_name : String):
	for party in parties:
		if party == team_name:
			return parties[party]


func check_for_eliminated_parties():
	for party in parties:
		if not party.is_public and party.active_hero_amount <= 0:
			team_eliminated.emit(party.parent_team)


func move_hero_to_party(hero : Hero, new_party : Party):
	var current_party = hero.party
	if current_party:
		current_party.remove_hero(hero)
	new_party.add_hero(hero)


func populate_new_hero_pool():
	var hero = load("res://Scripts/hero.gd")
	var hero_stat_dictionary = HERO_DATABASE.hero_stat_dictionary
	var new_hero_pool : Dictionary = {}
	
	for hero_name in HERO_DATABASE.hero_stat_dictionary:
		var new_hero = hero.new()
		new_hero.hero_name = hero_name
		new_hero.copy_stats(hero_stat_dictionary[hero_name])
		new_hero_pool[hero_name] = new_hero
	
	hero_pool = new_hero_pool


func get_hero_by_name(hero_name : String):
	return hero_pool[hero_name]
