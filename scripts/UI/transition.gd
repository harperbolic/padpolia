extends CanvasLayer

@onready var anim_player = $AnimationPlayer
signal fade_finished

func fade_in() -> void:
	anim_player.play("dissolve")
	await anim_player.animation_finished
	fade_finished.emit()

func fade_out() -> void:
	anim_player.play_backwards("dissolve")
	await anim_player.animation_finished
	fade_finished.emit()
