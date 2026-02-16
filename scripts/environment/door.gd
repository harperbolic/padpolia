extends can_interact
@export_enum("left", "right", "down", "top") var direction : String
@export var scene : String

func exec_action() -> void:
	SceneManager.load_scene(scene)

func _on_area_entered(area: Area2D):
	match direction:
		"top":
			area.top_move()
		"down":
			area.bottom_move()
		"left":
			area.left_move()
		"right":
			area.right_move()
	inside_area = true

func _on_area_exited(area: Area2D):
	area.reset_state()
	inside_area = false
