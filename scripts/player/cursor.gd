extends Area2D
class_name cursor

@onready var anim_player = $AnimationPlayer

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position = get_global_mouse_position()

func reset_state() -> void:
	anim_player.play("RESET")

func can_interact() -> void:
	anim_player.play("can_interact")

func top_move() -> void:
	anim_player.play("top_move")

func bottom_move() -> void:
	anim_player.play("bottom_move")

func left_move() -> void:
	anim_player.play("left_move")

func right_move() -> void:
	anim_player.play("right_move")
