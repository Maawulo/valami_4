class_name  Health
extends BaseResource


func _init(stats: StatManager) -> void:
	super(stats)
	growth_rate = 10
	setup(stat_manager.stamina * growth_rate)
	print(str(current) + "/" + str(max_resource))
	SignalManager.stat_change.connect(on_stat_change)
	
func die() -> void:
	print("Died")

func on_stat_change(_lvl: int) -> void:
	setup(stat_manager.stamina * growth_rate)
	pass
