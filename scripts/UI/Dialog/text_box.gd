extends Control
class_name textbox

var char_label : Label
var label: Label
var letter_timer : Timer

var text = ""
var letter_index = 0
var speaker_name
var scroll
var is_first_letter

var letter_time = 0.03
var space_time = 0.06
var punc_time = 0.2

var voice : String = "voice"
var played_sound = false

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
	text = text_to_display
	is_first_letter = true
	_display_letter()

func _display_letter():
	label.text = text
	label.visible_characters = letter_index + 1
	
	letter_index += 1
	if letter_index >= text.length():
		if played_sound == false:
			Audio.play_sfx(voice)
			played_sound = true
		finished_displaying.emit()
		return
	
	played_sound = false
	
	letter_timer.autostart = true
	
	match text[letter_index]:
		"!", ".", ",", "?", "…":
			letter_timer.start(punc_time)
		" ":
			letter_timer.start(space_time)
		_:
			letter_timer.start(letter_time)
	Audio.play_sfx(voice)

func _on_letter_display_timer_timeout() -> void:
	_display_letter()
	
	if is_first_letter:
		scroll = get_node("../../..")
		scroll.set_deferred("scroll_vertical", scroll.get_v_scroll_bar().max_value)
	
	is_first_letter = false

func _unhandled_input(event) -> void:
	if (
		event.is_action_pressed("advance_dialog")
	):
		letter_index = text.length()
