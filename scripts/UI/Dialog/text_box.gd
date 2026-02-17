extends Control
class_name textbox

var char_label : Label
var label: Label
var letter_timer : Timer

var dialog_text = ""
var letter_index = 0
var speaker_name
var scroll
var is_first_letter

var letter_time = 0.03
var space_time = 0.06
var punc_time = 0.2

var voice : String = "voice"
var played_sound = false

var character_voice = voice

signal finished_displaying

func display_text(text_to_display : String, speaker_name_func : String):
	#references
	letter_timer = $Timer
	label = $Text
	char_label = $Character
	
	voice = "voice"
	
	speaker_name = speaker_name_func
	match speaker_name:
		"MC":
			char_label.text = "Vadim"
			voice = "voiceMC"
		"OM":
			char_label.text = "Viyeniya"
			voice = "voiceOM"
		"YB":
			char_label.text = "Nezhidet"
			voice = "voiceYB"
		"AW":
			char_label.text = "Lichiye"
			voice = "voiceAW"
	
	character_voice = voice
	
	dialog_text = text_to_display
	is_first_letter = true
	
	_display_letter()

func _display_letter():
	label.text = dialog_text
	label.visible_characters = letter_index + 1
	
	letter_index += 1
	if letter_index >= dialog_text.length():
		if played_sound == false:
			Audio.play_sfx(voice)
			played_sound = true
		finished_displaying.emit()
		return
	
	played_sound = false
	
	letter_timer.autostart = true
	
	match dialog_text[letter_index]:
		"!", ".", ",", "?":
			letter_timer.start(punc_time)
		" ":
			letter_timer.start(space_time)
			voice = "none"
		_:
			letter_timer.start(letter_time)

func _on_letter_display_timer_timeout() -> void:
	if letter_index <= dialog_text.length() - 1:
		Audio.play_sfx(character_voice)
	
	if letter_index == 1:
		scroll = get_node("../../..")
		scroll.set_deferred("scroll_vertical", scroll.get_v_scroll_bar().max_value)
	
	_display_letter()
	
	is_first_letter = false

func _unhandled_input(event) -> void:
	if (
		event.is_action_pressed("advance_dialog")
	):
		letter_index = dialog_text.length()
