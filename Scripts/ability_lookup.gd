extends Node

var abilities : Dictionary = {}

func _ready() -> void:
	scan_for_abilities()


func scan_for_abilities():
	const ABILITIES_PATH = "res://Scripts/Abilities"
	
	#get directory of folder containing abilities
	var dir : DirAccess = DirAccess.open(ABILITIES_PATH)
	if dir:
		#iterate through abilities folder
		var dir_files = dir.get_files()
		for file in dir_files:
			#the ability file names are just the hero names, so get everything before the extension
			var hero_name = file.split(".")[0]
			if hero_name and !file.ends_with(".uid"):
				#add ability to the dictionary for easy lookup
				var ability = load(ABILITIES_PATH + "/" + file)
				abilities[hero_name] = ability


func get_ability(hero_name : String):
	return abilities[hero_name]
