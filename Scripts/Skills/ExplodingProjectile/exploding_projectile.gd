class_name ExplodingProjectileSkill extends Area3D

var caster : Unit

var projectile_speed : float
var damage : float
var heal_amount : float
var tick_time : float
var duration : float
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
	if body == target:
		#create explosion via an area attack
		var area = preload("res://Scripts/Skills/Area/area.tscn")
		var area_scene = area.instantiate()
		
		var collision_shape = CollisionShape3D.new()
		var mesh_instance = MeshInstance3D.new()
	
		if not caster:
			return
		
		area_scene.caster = caster
		area_scene.damage = damage
		area_scene.heal_amount = heal_amount
		area_scene.tick_time = tick_time
		area_scene.duration = duration
		area_scene.can_hit_enemies = can_hit_enemies
		area_scene.can_hit_allies = can_hit_allies
		area_scene.target = target
		
		collision_shape.shape = CylinderShape3D.new()
		collision_shape.shape.radius = radius
		collision_shape.shape.height = 1.0
		area_scene.add_child(collision_shape)
			
		mesh_instance.mesh = CylinderMesh.new()
		mesh_instance.mesh.top_radius = radius
		mesh_instance.mesh.bottom_radius = radius
		mesh_instance.mesh.height = 0.5
		area_scene.add_child(mesh_instance)
		
		#add explosion to scene tree and then delete projectile
		var skills_container = get_tree().current_scene.find_child("Battle", true, false).get_node("Skills")
		skills_container.add_child(area_scene)
		area_scene.start_tick_timer()
		queue_free()


func on_enemy_hit(enemy : Unit):
	enemy.take_damage(damage, caster)
	for status_effect in enemy_status_afflictions:
		enemy.status_effect_gained.emit(status_effect)


func on_ally_hit(ally : Unit):
	ally.heal(heal_amount)
	for status_effect in ally_status_afflictions:
		ally.status_effect_gained.emit(status_effect)
