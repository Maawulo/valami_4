class_name LevelManager
extends Resource

var _player: Player
var _exp_curve: Curve = load("res://systems/level/exp_curve.tres")
var current_exp: float = 0
var needed_exp: float = 0

func _init(player: Player) -> void:
	_player = player
	calculate_needed_exp()

func _level_up() -> void:
	_player.level += 1
	SignalManager.update_ui_level_up.emit(_player.level)


func gain_exp(amount: float) -> void:
	var new_exp: float = current_exp + amount
	if new_exp >= needed_exp:
		_level_up()
		current_exp = new_exp - needed_exp
		calculate_needed_exp()
	else:
		current_exp = new_exp
		
	SignalManager.update_ui_exp.emit(current_exp, needed_exp)
		
func _refresh_exp() -> void:
	pass

func calculate_needed_exp() -> void:
	var exp_need_by_curve: float = _exp_curve.sample(_player.level)
	needed_exp = exp_need_by_curve


func setup_exp() -> void:
	SignalManager.update_ui_exp.emit(current_exp, needed_exp)
