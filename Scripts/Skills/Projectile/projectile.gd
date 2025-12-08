class_name ProjectileSkill extends Area3D

var caster : Unit

var projectile_speed : float
var damage : float
var heal_amount : float
var radius : float

var can_hit_enemies : bool
var enemy_status_afflictions : Array = []
var can_hit_allies : bool
var ally_status_afflictions : Array = []

var target : Unit

func _ready() -> void:
	self.global_position = caster.global_position

func _process(delta: float) -> void:
	if target:
		var dir = (target.global_position - self.global_position).normalized()
		translate(dir * projectile_speed * delta)
	else:
		queue_free()


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Units") and (body != caster):
		if (body.team != caster.team) and can_hit_enemies:
			on_enemy_hit(body)
			queue_free()
		elif (body.team == caster.team) and can_hit_allies:
			on_ally_hit(body)
			queue_free()


func on_enemy_hit(enemy : Unit):
	enemy.take_damage(damage, caster)
	for status_effect in enemy_status_afflictions:
		enemy.status_effect_gained.emit(status_effect)


func on_ally_hit(ally : Unit):
	ally.heal(heal_amount)
	for status_effect in ally_status_afflictions:
		ally.status_effect_gained.emit(status_effect)
