extends Node2D
class_name can_interact

var selected = false
var inside_area = false
var is_in_range = false

func _on_area_entered(area: Area2D):
	area.can_interact()
	inside_area = true

func _on_area_exited(area: Area2D):
	area.reset_state()
	inside_area = false

func _on_body_entered(body: Node2D):
	if body is Player:
		is_in_range = true
		if selected:
			exec_action()

func _on_body_exited(body: Node2D):
	if body is Player:
		is_in_range = false
		print("exited area")

func exec_action() -> void:
	pass

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("left_click") and not Definitions.is_player_busy:
		if inside_area:
			selected = true
			if is_in_range:
				exec_action()
		else:
			selected = false
