extends Control

var button_action
var button_target

var label
var scroll

signal option_pressed
signal finished_displaying

func display_button(text_to_display : String, action : String, target):
	label = $"."
	
	button_action = action
	button_target = target
	
	label.text = text_to_display
	
	finished_displaying.emit()
	
	scroll = get_node("../../..")
	scroll.set_deferred("scroll_vertical", scroll.get_v_scroll_bar().max_value)

func _on_pressed() -> void:
	option_pressed.emit(label)
	
	label.disabled = true
	
	match button_action:
		"EXEC_DIALOG":
			Dialog.start_dialog(Definitions[button_target], false)
		"GIVE_ITEM":
			pass
		_:
			print ("ERROR: Button not specified.")
