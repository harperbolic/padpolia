extends Control

const CHOICE_BUTTON = preload("uid://csbdx3igw1lx6")
const CHAR_DIALOG = preload("uid://j6xyt5j27hmk")
const DM_DIALOG = preload("uid://bteuq4pv86koe")
const SEPARATOR = preload("uid://cwg8av2l6401l")
@onready var text_area: VBoxContainer = $Panel/VBoxContainer2/TextScroll/ScrollContainer/MarginContainer/textbox

var text = ""
var letter_index = 0
var speaker
var instance

var letter_time = 0.03
var space_time = 0.06
var punc_time = 0.2

var voice : String = "voice"

signal finished_displaying

func display_text(text_to_display : String, speaker_func : String):
	speaker = speaker_func
	match speaker:
		"DM":
			instance = DM_DIALOG.instantiate()
		"CH":
			instance = CHOICE_BUTTON.instantiate()
		_:
			instance = CHAR_DIALOG.instantiate()
	
	text_area.add_child(instance)
	text = text_to_display
	display_letter()
	
	return instance

func display_letter() -> void:
	match speaker:
		"DM":
			instance.text = text
			instance.visible_characters = letter_index + 1
		_:
			instance$Text.text = text
