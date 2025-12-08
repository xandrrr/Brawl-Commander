class_name Team extends Object

var team_name : String
var party : Party = null
#var team_resources : TeamResources = null
var status : String = "Waiting"
var placement : int = 0

signal eliminated


func _init(name_of_team : String):
	team_name = name_of_team


func join_table():
	status = "InGame"


func leave_table(team_placement : int):
	status = "Eliminated"
	eliminated.emit()
	placement = team_placement
