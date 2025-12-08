class_name HeroStatDatabase extends Resource

var hero_stat_dictionary = {
	"DefaultUnit" : {
		"stats" : {
			"attack_damage" : 10.0,
			"attack_speed" : 1.0,
			"max_health" : 100.0,
			"movement_speed" : 100.0,
			"ability_power" : 10.0,
			"ability_cooldown" : 10.0
		},
		"growth" : {
			"attack_damage" : 1.5,
			"attack_speed" : .02,
			"max_health" : 10.0,
			"movement_speed" : 1.5,
			"ability_power" : 2.0,
			"ability_cooldown" : -.15
		},
		"config" : {
			"attack_range" = 6.0,
			"ultimate_cost" = 200.0
		},
	},
	"TestUnit1" : {
		"stats" : {
			"attack_damage" : 10.0,
			"attack_speed" : 1.0,
			"max_health" : 1000.0,
			"movement_speed" : 200.0,
			"ability_power" : 10.0,
			"ability_cooldown" : 10.0
		},
		"growth" : {
			"attack_damage" : 1.5,
			"attack_speed" : .02,
			"max_health" : 10.0,
			"movement_speed" : 1.5,
			"ability_power" : 2.0,
			"ability_cooldown" : -.15
		},
		"config" : {
			"attack_range" = 6.0,
			"ultimate_cost" = 200.0
		}
	},
	"TestUnit2" : {
		"stats" : {
			"attack_damage" : 10.0,
			"attack_speed" : 1.0,
			"max_health" : 1000.0,
			"movement_speed" : 200.0,
			"ability_power" : 10.0,
			"ability_cooldown" : 10.0
		},
		"growth" : {
			"attack_damage" : 1.5,
			"attack_speed" : .02,
			"max_health" : 10.0,
			"movement_speed" : 1.5,
			"ability_power" : 2.0,
			"ability_cooldown" : -.15
		},
		"config" : {
			"attack_range" = 6.0,
			"ultimate_cost" = 200.0
		}
	},
	"TestUnit3" : {
		"stats" : {
			"attack_damage" : 10.0,
			"attack_speed" : 1.0,
			"max_health" : 1000.0,
			"movement_speed" : 200.0,
			"ability_power" : 10.0,
			"ability_cooldown" : 10.0
		},
		"growth" : {
			"attack_damage" : 1.5,
			"attack_speed" : .02,
			"max_health" : 10.0,
			"movement_speed" : 1.5,
			"ability_power" : 2.0,
			"ability_cooldown" : -.15
		},
		"config" : {
			"attack_range" = 6.0,
			"ultimate_cost" = 200.0
		}
	},
	"TestUnit4" : {
		"stats" : {
			"attack_damage" : 10.0,
			"attack_speed" : 1.0,
			"max_health" : 1000.0,
			"movement_speed" : 200.0,
			"ability_power" : 10.0,
			"ability_cooldown" : 10.0
		},
		"growth" : {
			"attack_damage" : 1.5,
			"attack_speed" : .02,
			"max_health" : 10.0,
			"movement_speed" : 1.5,
			"ability_power" : 2.0,
			"ability_cooldown" : -.15
		},
		"config" : {
			"attack_range" = 6.0,
			"ultimate_cost" = 200.0
		}
	},
	"TestUnit5" : {
		"stats" : {
			"attack_damage" : 10.0,
			"attack_speed" : 1.0,
			"max_health" : 1000.0,
			"movement_speed" : 200.0,
			"ability_power" : 10.0,
			"ability_cooldown" : 10.0
		},
		"growth" : {
			"attack_damage" : 1.5,
			"attack_speed" : .02,
			"max_health" : 10.0,
			"movement_speed" : 1.5,
			"ability_power" : 2.0,
			"ability_cooldown" : -.15
		},
		"config" : {
			"attack_range" = 6.0,
			"ultimate_cost" = 200.0
		}
	},
	"TestUnit6" : {
		"stats" : {
			"attack_damage" : 10.0,
			"attack_speed" : 1.0,
			"max_health" : 1000.0,
			"movement_speed" : 200.0,
			"ability_power" : 10.0,
			"ability_cooldown" : 10.0
		},
		"growth" : {
			"attack_damage" : 1.5,
			"attack_speed" : .02,
			"max_health" : 10.0,
			"movement_speed" : 1.5,
			"ability_power" : 2.0,
			"ability_cooldown" : -.15
		},
		"config" : {
			"attack_range" = 6.0,
			"ultimate_cost" = 200.0
		}
	},
	"TestUnit7" : {
		"stats" : {
			"attack_damage" : 10.0,
			"attack_speed" : 1.0,
			"max_health" : 1000.0,
			"movement_speed" : 200.0,
			"ability_power" : 10.0,
			"ability_cooldown" : 10.0
		},
		"growth" : {
			"attack_damage" : 1.5,
			"attack_speed" : .02,
			"max_health" : 10.0,
			"movement_speed" : 1.5,
			"ability_power" : 2.0,
			"ability_cooldown" : -.15
		},
		"config" : {
			"attack_range" = 6.0,
			"ultimate_cost" = 200.0
		}
	},
	"TestUnit8" : {
		"stats" : {
			"attack_damage" : 10.0,
			"attack_speed" : 1.0,
			"max_health" : 1000.0,
			"movement_speed" : 200.0,
			"ability_power" : 10.0,
			"ability_cooldown" : 10.0
		},
		"growth" : {
			"attack_damage" : 1.5,
			"attack_speed" : .02,
			"max_health" : 10.0,
			"movement_speed" : 1.5,
			"ability_power" : 2.0,
			"ability_cooldown" : -.15
		},
		"config" : {
			"attack_range" = 6.0,
			"ultimate_cost" = 200.0
		}
	}
}

func get_hero_stats(hero_name : String):
	return hero_stat_dictionary[hero_name]
