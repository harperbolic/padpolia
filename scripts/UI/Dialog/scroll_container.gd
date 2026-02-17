extends ScrollContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_v_scroll_bar().size.x = 0.125
	set_deferred("scroll_vertical", get_v_scroll_bar().max_value)
