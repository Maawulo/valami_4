class_name StatManagerPlayer
extends StatManager

var _player: Player

@export var base_stamina: float
@export var base_intellect: float
@export var base_strength: float
@export var base_dexterity: float


func setup(player: Player) -> void:
	_player = player
	stamina = base_stamina
	intellect = base_intellect
	strength = base_strength
	dexterity = base_dexterity
	SignalManager.level_up.connect(calculate_stats)
	

func calculate_stats(lvl: int) -> void:
	stamina = base_stamina * lvl
	intellect = base_intellect * lvl
	strength = base_strength * lvl
	dexterity = base_dexterity * lvl
