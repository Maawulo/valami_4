class_name Player
extends Entity

var level_manager: LevelManager = LevelManager.new(self)
var player_id: int
var stat_manager: StatManagerPlayer

enum PlayerClass {WARRIOR, MAGE}
@export var player_class: PlayerClass = PlayerClass.WARRIOR

func _ready() -> void:
	player_id = multiplayer.get_unique_id()
	GameManager.players[player_id] = self
	level_manager.setup_exp()
	
#region Load base stats for the corresponding class
	match player_class: 
		PlayerClass.WARRIOR:
			stat_manager = load("res://systems/stats/classes/warrior.tres")
		PlayerClass.MAGE:
			stat_manager = load("res://systems/stats/classes/mage.tres")
	stat_manager.setup(self)
#endregion
	
#region Setup resources: Health, Class resource
	
	
	health = Health.new(stat_manager)
#endregion

func _process(_delta: float) -> void:

#region TEST
	print_debug(stat_manager.stamina)
	if Input.is_action_just_pressed("test_button"):
		level_manager.gain_exp(50)
		
#endregion
