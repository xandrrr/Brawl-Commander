class_name Party extends Object

var parent_team : Team
var party_name : String
var heroes : Array = []
var active_hero_amount : int = 0
var is_public : bool = false


func add_hero(hero : Hero):
	heroes.append(hero)
	hero.party = self


func remove_hero(hero : Hero):
	heroes.erase(hero)
