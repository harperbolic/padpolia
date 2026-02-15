extends Area2D
class_name cursor

@onready var anim_player = $AnimationPlayer2D

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position = get_global_mouse_position()

func reset_state() -> void:
	anim_player.play("default")

func can_interact() -> void:
	anim_player.play("up")
