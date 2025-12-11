class_name Unit extends CharacterBody3D

var unit_name : String
var team : Team
var stats : Stats
var current_health : float = 0.0
var current_target : Unit
var ability : Ability
var ability_is_global : bool
var units_in_attack_range : Array = []
var attack_on_cooldown : bool = false
var ability_on_cooldown : bool = false
var unit_is_defeated : bool = false
@export var status_effects : Dictionary
@export var state_manager : StateManager
@export var health_bar : ProgressBar
@export var unit_name_label : Label
@export var status_effect_display_container : VBoxContainer

signal activated
signal enemy_in_attack_range
signal ability_cast_started
signal ability_cast_finished
signal defeated(attacker : Unit)

func _ready() -> void:
	add_to_group("Units")


func can_attack():
	for status in status_effects:
		if !is_instance_valid(status_effects[status]):
			status_effects.erase(status)
	
	if attack_on_cooldown:
		return false
	
	if unit_is_defeated:
		return false
	
	for effect in status_effects:
		if (status_effects[effect].blocks_attack == true):
			return false
	
	return true


func can_update_target():
	for status in status_effects:
		if !is_instance_valid(status_effects[status]):
			status_effects.erase(status)
	
	if unit_is_defeated:
		return false
	
	for effect in status_effects:
		if (status_effects[effect].blocks_target_update == true):
			return false
	
	return true


func add_status_effect(status_effect_name : String, inflictor : Unit):
	var status_effect = look_up_status_effect(status_effect_name)
	
	var status_effect_already_inflicted : bool = false
	if status_effect:
		for effect in status_effects:
			if effect == status_effect_name:
				status_effect_already_inflicted = true
				status_effects[effect].add_stack()
				return status_effects[effect]
	
	if !status_effect_already_inflicted:
		#create the status effect
		var status_effect_scene = status_effect.instantiate()
		status_effect_scene.status_name = status_effect_name
		status_effect_scene.inflictor = inflictor
		status_effect_scene.affected_unit = self
		
		#add status effect to containers
		$StatusEffectHolder.add_child(status_effect_scene)
		status_effects[status_effect_scene.status_name] = status_effect_scene
		add_status_effect_label(status_effect_name)
		
		#connect status effect timer to cleanup
		status_effect_scene.get_node("DurationTimer").timeout.connect(func(): 
			status_effects.erase(status_effect_scene.status_name)
			remove_status_effect_label(status_effect_name)
		)
		
		#activate status effect
		status_effect_scene.activate()
		return status_effect_scene


func look_up_status_effect(status_effect_name : String):
	var status_effect_path = StatusEffectLookup.status_dictionary[status_effect_name]
	if FileAccess.file_exists(status_effect_path):
		var status_effect = load(status_effect_path)
		return status_effect


func add_status_effect_label(status_effect_name : String):
	var new_label = Label.new()
	$StatusEffectsViewport/StatusEffectNameContainer.add_child(new_label)
	new_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	new_label.name = status_effect_name
	new_label.text = status_effect_name


func remove_status_effect_label(status_effect_name : String):
	var labels = $StatusEffectsViewport/StatusEffectNameContainer.get_children()
	for label in labels:
		if label.name == status_effect_name:
			label.queue_free()
			break

#functions to handle stats
func get_stat(stat_category : String, stat_name : String):
	return stats.stats_dictionary[stat_category][stat_name]


func get_stats():
	if stats:
		return stats
	else:
		push_warning("Stats have not yet been set.")


func modify_stat(stat_category : String, stat_name : String, amount : float):
	stats.stats_dictionary[stat_category][stat_name] += amount


func adjust_stats_to_level(level : int):
	for stat in stats.stats_dictionary["stats"]:
		var modification_value = get_stat("growth", stat) * level
		modify_stat("stats", stat, modification_value)

#functions to heal and take damage
func heal(amount : float):
	var can_heal : bool = true
	
	for effect in status_effects:
		if status_effects[effect].blocks_heal:
			can_heal = false
			break
	
	if can_heal:
		current_health += amount
		$FeedbackAnimationPlayer.play("heal")
		$HealSound.play()
		current_health = min(current_health, get_stat("stats","max_health"))
		update_health_bar()


func take_damage(amount : float, attacker : Unit):
	if !unit_is_defeated:
		current_health -= amount
		print(unit_name, " has taken ", amount, " damage from ", attacker.unit_name)
		$FeedbackAnimationPlayer.play("hurt")
		$HurtSound.play()
		
		for effect in status_effects:
			status_effects[effect].on_unit_damaged(amount, attacker)
		
		if current_health <= 0.0:
			defeated.emit(attacker)
		update_health_bar()


func take_damage_without_effects(amount : float, attacker : Unit):
	if !unit_is_defeated:
		current_health -= amount
		print(unit_name, " has taken ", amount, " damage from ", attacker.unit_name)
		$FeedbackAnimationPlayer.play("hurt")
		
		if current_health <= 0.0:
			defeated.emit(attacker)
		update_health_bar()


func activate():
	current_health = get_stat("stats","max_health")
	update_health_bar()
	set_unit_name()
	activated.emit()

#functions to update target
func update_target(unit : Unit):
		current_target = unit
		print(unit_name, " is updating target to ", unit.unit_name)


func update_target_to_closest_enemy():
	if can_update_target():
		current_target = get_closest_enemy_unit()

#getting nearby units of various types
func get_closest_unit():
	var closest_target : Unit = null
	var closest_target_distance : float = 0.0
	var battle = get_tree().get_first_node_in_group("Battle")
	for unit in battle.active_units_in_battle:
		if (unit != self):
				var distance : float = unit.global_position.distance_to(self.global_position)
				if (distance < closest_target_distance) or (closest_target == null):
					closest_target = unit
					closest_target_distance = distance
	
	return closest_target


func get_closest_enemy_unit():
	var closest_target : Unit = null
	var closest_target_distance : float = 0.0
	var battle = get_tree().get_first_node_in_group("Battle")
	for unit in battle.active_units_in_battle:
		if (unit.team != team)  and (unit != self):
				var distance : float = unit.global_position.distance_to(self.global_position)
				if (distance < closest_target_distance) or (closest_target == null):
					closest_target = unit
					closest_target_distance = distance
	
	return closest_target


func get_random_enemy_unit():
	var enemy_unit : Unit
	var battle = get_tree().get_first_node_in_group("Battle")
	var units_in_battle = battle.active_units_in_battle
	while (!enemy_unit):
		var random_int = randi_range(0,(units_in_battle.size() - 1))
		var random_unit = units_in_battle[random_int]
		if random_unit.team != team:
			enemy_unit = random_unit
			break
	return enemy_unit


func get_closest_ally_unit():
	var closest_target : Unit = null
	var closest_target_distance : float = 0.0
	var battle = get_tree().get_first_node_in_group("Battle")
	for unit in battle.active_units_in_battle:
		if (unit.team == team)  and (unit != self):
				var distance : float = unit.global_position.distance_to(self.global_position)
				if (distance < closest_target_distance) or (closest_target == null):
					closest_target = unit
					closest_target_distance = distance
	
	if closest_target == null:
		closest_target = self
	
	return closest_target


func _on_attack_range_body_entered(body: Node3D) -> void:
	if body.is_in_group("Units"):
		if body.team != team:
			units_in_attack_range.append(body)
			enemy_in_attack_range.emit()


func _on_attack_range_body_exited(body: Node3D) -> void:
	if body.is_in_group("Units"):
		if body.team != team:
			units_in_attack_range.erase(body)


func erase_unit_from_attack_range(unit : Unit):
	units_in_attack_range.erase(unit)


func update_health_bar():
	health_bar.max_value = get_stat("stats","max_health")
	health_bar.value = current_health


func set_unit_name():
	unit_name_label.text = unit_name

func create_stats_from_dictionary(stats_dictionary : Dictionary):
	stats = load("res://Scripts/stats.gd").new(stats_dictionary)


func _on_attack_timer_timeout() -> void:
	attack_on_cooldown = false


func _on_ability_cooldown_timer_timeout() -> void:
	ability_on_cooldown = false


func _on_target_search_timer_timeout() -> void:
	update_target_to_closest_enemy()


#ability casting
func start_ability_cooldown(cast_time : float):
	$AbilityCooldownTimer.start()
	ability_on_cooldown = true
	ability_cast_started.emit()
	
	$AbilityCastTimer.wait_time = cast_time
	$AbilityCastTimer.start()


func can_cast():
	for status in status_effects:
		if !is_instance_valid(status_effects[status]):
			status_effects.erase(status)
	
	if ability_on_cooldown:
		return false
	
	if (units_in_attack_range.size() == 0) and !ability.global:
		return false
	
	if unit_is_defeated:
		return false
	
	for effect in status_effects:
		if (status_effects[effect].blocks_cast == true):
			return false
	
	return true


func _on_ability_cast_timer_timeout() -> void:
	ability_cast_finished.emit()
