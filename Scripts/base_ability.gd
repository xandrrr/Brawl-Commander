class_name Ability extends Resource

@export var ability_name: String = "default"
@export var ability_type : String = "default"
@export var ability_shape : String = "cylinder"
@export var size : Vector3
@export var damage : float = 0.0
@export var tick_time : float = 0.0
@export var heal_amount : float = 0.0
@export var speed : float = 0.0
@export var duration : float = 0.0
@export var target_location : Vector3
@export var targets_enemies : bool
@export var targets_allies : bool
@export var cast_time : float = 0.5
@export var enemy_status_effect_afflictions : Array
@export var ally_status_effect_afflictions : Array
@export var self_status_effect_afflictions : Array
@export var material_information : Dictionary
@export var targeting_type = "nearest_enemy"
@export var global : bool = false
@export var ability_description : String = "This is a placeholder ability description."
