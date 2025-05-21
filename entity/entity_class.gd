class_name Entity
extends CharacterBody2D

@export var entity_name: String
var level: int = 1

enum EntityClass {WARRIOR, MAGE}
@export var entity_class: EntityClass = EntityClass.WARRIOR

var stat_manager: StatManager
var health: Health

func _ready() -> void:
#region Load base stats for the corresponding class
	match entity_class: 
		EntityClass.WARRIOR:
			stat_manager = load("res://systems/stats/warrior.tres")
		EntityClass.MAGE:
			stat_manager = load("res://systems/stats/mage.tres")
	stat_manager.setup()
#endregion
	
#region Setup resources: Health, Class resource
	
	
	health = Health.new(stat_manager)
#endregion
