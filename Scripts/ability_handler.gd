extends Node3D

var skills_container : Node3D
@export var unit : Unit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	skills_container = get_tree().current_scene.find_child("Battle", true, false).get_node("Skills")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	attempt_cast()


func attempt_cast():
	if unit.can_cast():
		cast_ability(unit, unit.ability)


func cast_ability(unit, ability):
	
	unit.start_ability_cooldown(ability.cast_time)
	unit.ability_cast_started.emit()
	
	match ability.ability_type:
		"default":
			SkillMaker.create_debug(unit, ability)
		"projectile":
			var projectile = SkillMaker.create_projectile(unit, ability)
			skills_container.add_child(projectile)
		"area_attack":
			var area = SkillMaker.create_area_attack(unit, ability)
			skills_container.add_child(area)
			area.activate()
			area.start_tick_timer()
		"dash":
			var dash = SkillMaker.create_dash(unit, ability)
			skills_container.add_child(dash)
			dash.dash()
		"targetable":
			var targetable = SkillMaker.create_targetable(unit, ability)
			skills_container.add_child(targetable)
		"exploding_projectile":
			var exploding_projectile = SkillMaker.create_exploding_projectile(unit, ability)
			skills_container.add_child(exploding_projectile)
