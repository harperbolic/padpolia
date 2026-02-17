extends Node

signal sfx_finished

func play_sfx(id : String) -> void:
	var node = get_node("%SFX/" + id)
	node.play()

func play_music(id : String) -> void:
	var node = get_node("%Music/" + id)
	node.play()

func stop_music(id : String) -> void:
	var node = get_node("%Music/" + id)
	node.stop()

func stop_all_music() -> void:
	var root_node = get_node("%Music")
	var audio_node
	for child in root_node.get_children():
		audio_node = child
		audio_node.stop()

func _on_dialog_end_finished() -> void:
	sfx_finished.emit()
