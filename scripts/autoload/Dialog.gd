extends Node

@onready var container_scene = preload("res://components/UI/dialog_container.tscn")

var dialog_lines : Dictionary = {}
var current_line_index = 0

var container
var text_line

var is_dialog_active = false
var can_advance_line = false
var is_new_dialog = true

var boxes : Array = []

signal dialog_ended

func start_dialog(lines: Dictionary, local_is_new_dialog : bool):
	if is_dialog_active:
		return
	
	is_new_dialog = local_is_new_dialog
	
	dialog_lines = lines
	
	_display_container()
	_pass_line()
	
	is_dialog_active = true

func _display_container() -> void:
	container = container_scene.instantiate()
	
	if is_new_dialog:
		clear_boxes()

func _pass_line() -> void:
	
	container.finished_displaying.connect(_on_text_finished_displaying)
	boxes.append(container.display_text(dialog_lines[str(current_line_index)].text, dialog_lines[str(current_line_index)].name))
	can_advance_line = false


func _on_text_finished_displaying() -> void:
	can_advance_line = true

func _unhandled_input(event) -> void:
	if (
		event.is_action_pressed("advance_dialog") && 
		is_dialog_active &&
		can_advance_line
	):
		
		current_line_index += 1
		if current_line_index >= dialog_lines.size():
			clear_boxes()
			container.queue_free()
			dialog_ended.emit()
			return
		
		_pass_line()


func clear_boxes() -> void:
	for i in boxes:
		boxes[i].queue_free()
