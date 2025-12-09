extends Node3D

const SKILLS_PATH = "res://Scripts/Skills/"


func create_projectile(unit : Unit, ability : Ability):
	print("Ability cast: ", unit.unit_name, " ", ability.ability_name)
	var projectile = preload(SKILLS_PATH + "Projectile/projectile.tscn")
	var projectile_scene = projectile.instantiate()
	
	projectile_scene.caster = unit
	projectile_scene.projectile_speed = ability.speed
	projectile_scene.damage = ability.damage + unit.get_stat("stats","ability_power")
	projectile_scene.heal_amount = ability.heal_amount + unit.get_stat("stats","ability_power")
	projectile_scene.can_hit_enemies = ability.targets_enemies
	projectile_scene.can_hit_allies = ability.targets_allies
	projectile_scene.enemy_status_afflictions = ability.enemy_status_effect_afflictions
	projectile_scene.ally_status_afflictions = ability.ally_status_effect_afflictions
	
	#create collision shape and mesh for the projectile
	var collision_shape = CollisionShape3D.new()
	collision_shape.shape = SphereShape3D.new()
	collision_shape.shape.radius = ability.size.x
	projectile_scene.add_child(collision_shape)
	
	var mesh_instance = MeshInstance3D.new()
	mesh_instance.mesh = SphereMesh.new()
	mesh_instance.mesh.radius = ability.size.x
	projectile_scene.add_child(mesh_instance)
	
	#set the target for the projectile
	match ability.targeting_type:
		"nearest_enemy":
			projectile_scene.target = unit.get_closest_enemy_unit()
		"nearest_ally":
			projectile_scene.target = unit.get_closest_ally_unit()
		"any_other_unit":
			projectile_scene.target = unit.get_closest_unit()
	
	return projectile_scene


func create_area_attack(unit : Unit, ability : Ability):
	print("Ability cast: ", unit.unit_name, " ", ability.ability_name)
	var area = preload(SKILLS_PATH + "Area/area.tscn")
	var area_scene = area.instantiate()
	
	area_scene.caster = unit
	area_scene.damage = ability.damage + unit.get_stat("stats","ability_power")
	area_scene.heal_amount = ability.heal_amount + unit.get_stat("stats","ability_power")
	area_scene.tick_time = ability.tick_time
	area_scene.duration = ability.duration
	area_scene.can_hit_enemies = ability.targets_enemies
	area_scene.can_hit_allies = ability.targets_allies
	area_scene.enemy_status_afflictions = ability.enemy_status_effect_afflictions
	area_scene.ally_status_afflictions = ability.ally_status_effect_afflictions
	area_scene.self_status_afflictions = ability.self_status_effect_afflictions
	
	#create collision shape and mesh, depending on the desired shape of the area
	var collision_shape = CollisionShape3D.new()
	var mesh_instance = MeshInstance3D.new()
	match ability.ability_shape:
		"cylinder":
			collision_shape.shape = CylinderShape3D.new()
			area_scene.add_child(collision_shape)
			collision_shape.shape.radius = ability.size.x
			collision_shape.shape.height = 1.0
			
			mesh_instance.mesh = CylinderMesh.new()
			area_scene.add_child(mesh_instance)
			mesh_instance.mesh.top_radius = ability.size.x
			mesh_instance.mesh.bottom_radius = ability.size.x
			
			var color = Color(.8,.8,.8,.35)
			var transparent_material = StandardMaterial3D.new()
			transparent_material.albedo_color = color
			transparent_material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			mesh_instance.material_override = transparent_material
	
	#set the target for the area
	match ability.targeting_type:
		"nearest_enemy":
			area_scene.target = unit.get_closest_enemy_unit()
		"nearest_ally":
			area_scene.target = unit.get_closest_ally_unit()
		"any_other_unit":
			area_scene.target = unit.get_closest_unit()
		"self":
			area_scene.target = unit
	
	return area_scene


func create_dash(unit : Unit, ability : Ability):
	print("Ability cast: ", unit.unit_name, " ", ability.ability_name)
	var dash = preload(SKILLS_PATH + "Dash/dash.tscn")
	var dash_scene = dash.instantiate()
	
	dash_scene.caster = unit
	dash_scene.damage = ability.damage + unit.get_stat("stats","ability_power")
	dash_scene.heal_amount = ability.heal_amount + unit.get_stat("stats","ability_power")
	dash_scene.duration = ability.duration
	dash_scene.can_hit_enemies = ability.targets_enemies
	dash_scene.can_hit_allies = ability.targets_allies
	dash_scene.enemy_status_afflictions = ability.enemy_status_effect_afflictions
	dash_scene.ally_status_afflictions = ability.ally_status_effect_afflictions
	dash_scene.self_status_afflictions = ability.self_status_effect_afflictions
	
	match ability.targeting_type:
		"nearest_enemy":
			dash_scene.target = unit.get_closest_enemy_unit()
		"random_enemy":
			dash_scene.target = unit.get_random_enemy_unit()
		"nearest_ally":
			dash_scene.target = unit.get_closest_ally_unit()
		"any_other_unit":
			dash_scene.target = unit.get_closest_unit()
	
	return dash_scene


func create_targetable(unit : Unit, ability : Ability):
	print("Ability cast: ", unit.unit_name, " ", ability.ability_name)
	var targetable = preload(SKILLS_PATH + "Targetable/targetable.tscn")
	var targetable_scene = targetable.instantiate()
	
	targetable_scene.caster = unit
	targetable_scene.damage = ability.damage + unit.get_stat("stats","ability_power")
	targetable_scene.heal_amount = ability.heal_amount + unit.get_stat("stats","ability_power")
	targetable_scene.enemy_status_afflictions = ability.enemy_status_effect_afflictions
	targetable_scene.ally_status_afflictions = ability.ally_status_effect_afflictions
	
	match ability.targeting_type:
		"nearest_enemy":
			targetable_scene.target = unit.get_closest_enemy_unit()
		"nearest_ally":
			targetable_scene.target = unit.get_closest_ally_unit()
		"any_other_unit":
			targetable_scene.target = unit.get_closest_unit()
		"self":
			targetable_scene.target = unit
	
	return targetable_scene


func create_exploding_projectile(unit : Unit, ability : Ability):
	print("Ability cast: ", unit.unit_name, " ", ability.ability_name)
	var exploding_projectile = preload(SKILLS_PATH + "ExplodingProjectile/exploding_projectile.tscn")
	var exploding_projectile_scene = exploding_projectile.instantiate()
	
	exploding_projectile_scene.caster = unit
	exploding_projectile_scene.projectile_speed = ability.speed
	exploding_projectile_scene.damage = ability.damage + unit.get_stat("stats","ability_power")
	exploding_projectile_scene.heal_amount = ability.heal_amount
	exploding_projectile_scene.tick_time = ability.tick_time
	exploding_projectile_scene.duration = ability.duration
	exploding_projectile_scene.radius = ability.size.x
	exploding_projectile_scene.can_hit_enemies = ability.targets_enemies
	exploding_projectile_scene.can_hit_allies = ability.targets_allies
	exploding_projectile_scene.enemy_status_afflictions = ability.enemy_status_effect_afflictions
	exploding_projectile_scene.ally_status_afflictions = ability.ally_status_effect_afflictions
	
	#create collision shape and mesh for the projectile
	var collision_shape = CollisionShape3D.new()
	collision_shape.shape = SphereShape3D.new()
	collision_shape.shape.radius = .5
	exploding_projectile_scene.add_child(collision_shape)
	
	var mesh_instance = MeshInstance3D.new()
	mesh_instance.mesh = SphereMesh.new()
	mesh_instance.mesh.radius = .5
	exploding_projectile_scene.add_child(mesh_instance)
	
	#set the target for the projectile
	match ability.targeting_type:
		"nearest_enemy":
			exploding_projectile_scene.target = unit.get_closest_enemy_unit()
		"nearest_ally":
			exploding_projectile_scene.target = unit.get_closest_ally_unit()
		"any_other_unit":
			exploding_projectile_scene.target = unit.get_closest_unit()
	
	return exploding_projectile_scene


func create_debug(unit : Unit, ability : Ability):
	print("Ability cast: ", unit.unit_name, " ", ability.ability_name)
	return true
