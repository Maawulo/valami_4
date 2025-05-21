class_name  Health
extends BaseResource


func _init(stats: StatManager) -> void:
	super(stats)
	growth_rate = 10
	print(stat_manager.base_stamina)
	print(stat_manager.stamina)
	setup(stat_manager.stamina * growth_rate)
	print(str(current) + "/" + str(max_resource))
	
	
func die() -> void:
	print("Died")
