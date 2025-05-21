extends Control


@onready var xp_bar: TextureProgressBar = $XPBar
@onready var xp_text: Label = $XPBar/XpText
@onready var xp_percent: Label = $XPBar/XpPercent

func _init() -> void:
	SignalManager.update_ui_exp.connect(update_xp_bar)
	SignalManager.update_ui_level_up.connect(update_level)


func update_xp_bar(current_exp: float, max_exp: float) -> void:
	xp_bar.max_value = max_exp
	xp_bar.value = current_exp
	xp_text.text = str(int(current_exp)) + "/" + str(int(max_exp))
	var percent: int = calculate_exp_percent(current_exp, max_exp)
	xp_percent.text = str(percent) + "%"
	
	
func update_level(_level: int) -> void:
	pass

func calculate_exp_percent(curr: float, max_value: float) -> int:
	var percent: float = curr / max_value * 100
	return int(percent)
