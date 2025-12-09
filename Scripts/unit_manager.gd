class_name UnitManager extends Node3D

const BASE_UNIT = preload("res://Elements/unit.tscn")
const HERO_DATABASE = preload("res://Assets/Resources/hero_stat_database.tres")
const ABILITIES_PATH = "res://Scripts/Abilities/"

signal unit_added(unit : Unit)
signal unit_died(unit : Unit)

func add_unit_from_hero(hero : Hero):
	var hero_stats = HERO_DATABASE.get_hero_stats(hero.hero_name)
	if hero_stats:
		var new_unit = BASE_UNIT.instantiate()
		add_child(new_unit)
		new_unit.unit_name = hero.hero_name
		new_unit.create_stats_from_dictionary(hero_stats)
		new_unit.adjust_stats_to_level(hero.level)
		
		new_unit.defeated.connect(func(attacker : Unit):
			unit_died.emit(new_unit)
		)
		
		var collision_shape = new_unit.get_node("AttackRange").get_node("CollisionShape3D")
		var duplicated_shape = collision_shape.shape.duplicate()
		collision_shape.shape = duplicated_shape
		collision_shape.shape.radius = new_unit.get_stat("config","attack_range")
		
		var ability_path = ABILITIES_PATH + hero.hero_name + ".gd"
		
		new_unit.get_node("AbilityCooldownTimer").wait_time = new_unit.stats.stats_dictionary["stats"]["ability_cooldown"]
		
		if FileAccess.file_exists(ability_path):
			new_unit.ability = load(ability_path).new()
		else:
			new_unit.ability = load(ABILITIES_PATH + "base_ability.gd").new()

		unit_added.emit(new_unit)
		return new_unit


func add_units_from_party(party : Party):
	for hero in party.heroes:
		var new_unit = add_unit_from_hero(hero)
		new_unit.team = party.parent_team


func activate_units(units : Array):
	for unit in units:
		unit.activate()


func parse_units_in_team(units : Array, team : Team):
	var units_in_team = []
	for unit in units:
		if unit.team == team:
			units_in_team.append(unit)
	return units_in_team


func remove_unit_from_attack_ranges(units : Array, target_unit : Unit):
	for unit in units:
		unit.erase_unit_from_attack_range(target_unit)
