class_name TargetableSkill extends Area3D

var caster : Unit

var damage : float
var heal_amount : float

var enemy_status_afflictions : Array = []
var ally_status_afflictions : Array = []

var target : Unit

func _ready() -> void:
	if target.team != caster.team:
		on_enemy_hit(target)
	elif target.team == caster.team:
		on_ally_hit(target)
	
	queue_free()


func on_enemy_hit(enemy : Unit):
	enemy.take_damage(damage, caster)
	for status_effect in enemy_status_afflictions:
		enemy.add_status_effect(status_effect, caster)


func on_ally_hit(ally : Unit):
	ally.heal(heal_amount)
	for status_effect in ally_status_afflictions:
		ally.add_status_effect(status_effect, caster)
