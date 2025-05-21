class_name StatManager
extends Resource

@warning_ignore("unused_signal")
signal on_stat_change

var stamina: float
var intellect: float
var strength: float
var dexterity: float

@export var base_stamina: float
@export var base_intellect: float
@export var base_strength: float
@export var base_dexterity: float


func setup() -> void:
	stamina = base_stamina
	intellect = base_intellect
	strength = base_strength
	dexterity = base_dexterity
