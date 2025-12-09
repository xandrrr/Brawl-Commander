class_name Hero extends Object

const STATS_PATH = preload("res://Scripts/stats.gd")

var hero_name : String
var party : Party
var stats : Stats
var level : int 

func copy_stats(desired_stats : Dictionary):
	var new_stats = STATS_PATH.new(desired_stats)
	stats = new_stats
