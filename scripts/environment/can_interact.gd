extends Area2D
class_name can_interact

func _on_area_entered(area: Area2D):
	area.can_interact()

func _on_area_exited(area: Area2D):
	area.reset_state()
