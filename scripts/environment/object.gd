extends can_interact
@export var has_item : bool
@export var has_dialog : bool
@export var dialog : String
@export var itemID : int
@export var is_one_time : bool

var has_interacted = false
@export var has_interacted_dialog : String

func exec_action() -> void:
	if not has_interacted:
		has_interacted = true
		if has_dialog:
			Dialog.start_dialog(Definitions[dialog], true)
		if has_item:
			pass
	else:
		Dialog.start_dialog(Definitions[has_interacted_dialog], true)
	
	
