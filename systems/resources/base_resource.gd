class_name BaseResource
extends Resource

@warning_ignore("unused_signal")
signal on_resource_change

var stat_manager: StatManager
var growth_rate: float

func _init(stats: StatManager) -> void:
	stat_manager = stats
	SignalManager.level_up.connect(on_level_up)

var max_resource: float
var current: float:
	get:
		return current
	set(value):
		current = clampf(value, 0, max_resource)

var regeneration_rate: float
var regeneration_time: float

func add_resource(value: float) -> void:
	current += value

func negotiate_resource(value: float) -> void:
	current -= value


func setup(max_value: float) -> void:
	max_resource = max_value
	current = max_resource

func on_level_up(_lvl: int) -> void:
	pass
	
