class_name Player
extends Entity

var level_manager: LevelManager = LevelManager.new(self)
var player_id: int

func _ready() -> void:
	player_id = multiplayer.get_unique_id()
	GameManager.players[player_id] = self
	level_manager.setup_exp()


func _process(_delta: float) -> void:
	
#region TEST
	if Input.is_action_just_pressed("test_button"):
		level_manager.gain_exp(50)
		
#endregion
