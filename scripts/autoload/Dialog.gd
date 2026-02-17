extends Node

const DIALOG_CONTAINER = preload("uid://dia1c4ofp2yga")

const CHOICE_BUTTON = preload("uid://csbdx3igw1lx6")
const CHAR_DIALOG = preload("uid://j6xyt5j27hmk")
const DM_DIALOG = preload("uid://bteuq4pv86koe")
const SEPARATOR = preload("uid://cwg8av2l6401l")

var dialog_lines : Dictionary = {}
var current_line_index = 0

var container
var text_box
var text_line

var last_textbox_passed

var is_dialog_active = false
var can_advance_line = false
var is_new_dialog = true

signal dialog_ended

func start_dialog(lines: Dictionary, local_is_new_dialog : bool):
	current_line_index = 0
	if is_dialog_active && local_is_new_dialog == true:
		return
	
	is_new_dialog = local_is_new_dialog
	
	dialog_lines = lines
	
	_display_container()
	_pass_line()
	
	is_dialog_active = true

func _display_container() -> void:
	if is_new_dialog:
		container = DIALOG_CONTAINER.instantiate()
		add_child(container)

func _pass_line() -> void:
	var textbox_slot = container.get_node("Panel/VBoxContainer2/TextScroll/ScrollContainer/MarginContainer/textbox")
	if last_textbox_passed != "choice" and dialog_lines[str(current_line_index)].name == "CH":
		textbox_slot.add_child(SEPARATOR.instantiate())
	
	match dialog_lines[str(current_line_index)].name:
		"CH":
			text_box = CHOICE_BUTTON.instantiate()
			last_textbox_passed = "choice"
		"DM":
			text_box = DM_DIALOG.instantiate()
			last_textbox_passed = "DM"
		"EXEC_DIALOG":
			Dialog.start_dialog(Definitions.DialogTable[dialog_lines[str(current_line_index)].text], false)
			return
		_:
			text_box = CHAR_DIALOG.instantiate()
			last_textbox_passed = "char"
		
	text_box.finished_displaying.connect(_on_text_finished_displaying)
	
	textbox_slot.add_child(text_box)
	text_box.display_text(dialog_lines[str(current_line_index)].text, dialog_lines[str(current_line_index)].name)
	
	can_advance_line = false


func _on_text_finished_displaying() -> void:
	can_advance_line = true
	text_box.finished_displaying.disconnect(_on_text_finished_displaying)

func _unhandled_input(event) -> void:
	if (
		event.is_action_pressed("advance_dialog") && 
		is_dialog_active &&
		can_advance_line
	):
		current_line_index += 1
		if current_line_index >= dialog_lines.size():
			Audio.play_sfx("dialog_end")
			await Audio.sfx_finished
			container.queue_free()
			dialog_ended.emit()
			is_dialog_active = false
			return
		_pass_line()
