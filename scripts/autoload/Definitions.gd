extends Node

var is_player_busy = false

var access
# Loop 1
# Old Man
var OM_L1_0 : Dictionary
var OM_L1_1C : Dictionary
var OM_L1_2C : Dictionary
var OM_L1_3 : Dictionary
var OM_L1_4 : Dictionary

func _ready() -> void:
	load_loop1()

func load_loop1() -> void:
	access = FileAccess.open("res://text/OM_L1_0.json", FileAccess.READ)
	OM_L1_0 = JSON.parse_string(access.get_as_text())
	access.close()
	access = FileAccess.open("res://text/OM_L1_1C.json", FileAccess.READ)
	OM_L1_1C = JSON.parse_string(access.get_as_text())
	access.close()
	access = FileAccess.open("res://text/OM_L1_2C.json", FileAccess.READ)
	OM_L1_2C = JSON.parse_string(access.get_as_text())
	access.close()
	access = FileAccess.open("res://text/OM_L1_3.json", FileAccess.READ)
	OM_L1_3 = JSON.parse_string(access.get_as_text())
	access.close()
	access = FileAccess.open("res://text/OM_L1_4.json", FileAccess.READ)
	OM_L1_4 = JSON.parse_string(access.get_as_text())
	access.close()
	

var DialogTable : Dictionary = {
	"OM_L1_0" : OM_L1_0,
	"OM_L1_1C" : OM_L1_1C,
	"OM_L1_2C" : OM_L1_2C,
	"OM_L1_3" : OM_L1_3,
	"OM_L1_4" : OM_L1_4
}
