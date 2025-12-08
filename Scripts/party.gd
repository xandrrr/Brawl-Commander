class_name Party extends Object

var parent_team : Team
var party_name : String
var heroes : Array = []
var active_hero_amount : int = 0
var is_public : bool = false


func add_hero(hero : Hero):
	heroes.append(hero)
	hero.party = self
	update_active_hero_amount()


func remove_hero(hero : Hero):
	heroes.erase(hero)
	update_active_hero_amount()


func toggle_benched(hero : Hero):
	hero.benched = !hero.benched


func update_active_hero_amount():
	var updated_active_hero_amount = 0
	for hero in heroes:
		if hero.status == "InGame":
			updated_active_hero_amount += 1
	
	active_hero_amount = updated_active_hero_amount
