extends textbox

func display_text(text_to_display : String, speaker_name_func : String):
	letter_timer = $Timer
	label = $"."
	
	voice = "voice"
	
	speaker_name = speaker_name_func
	dialog_text = str("   ", text_to_display)
	is_first_letter = true
	_display_letter()

func _display_letter():
	label.text = dialog_text
	label.visible_characters = letter_index + 1
	
	letter_index += 1
	if letter_index >= dialog_text.length():
		finished_displaying.emit()
		return
	
	played_sound = false
	
	letter_timer.autostart = true
	
	match dialog_text[letter_index]:
		"!", ".", ",", "?", "…":
			letter_timer.start(punc_time)
		" ":
			letter_timer.start(space_time)
		_:
			letter_timer.start(letter_time)
