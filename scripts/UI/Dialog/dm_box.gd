extends textbox

func display_text(text_to_display : String, speaker_name_func : String):
	letter_timer = $Timer
	
	voice = "voice"
	
	speaker_name = speaker_name_func
	text = text_to_display
	is_first_letter = true
	_display_letter()

func _display_letter():
	Audio.play_sfx(voice)
	$".".text = text
	$".".visible_characters = letter_index + 1
	
	letter_index += 1
	if letter_index >= text.length():
		finished_displaying.emit()
		return
	
	letter_timer.autostart = true
	
	match text[letter_index]:
		"!", ".", ",", "?", "…":
			letter_timer.start(punc_time)
		" ":
			letter_timer.start(space_time)
			voice = "none"
		_:
			letter_timer.start(letter_time)
	Audio.play_sfx(voice)
