extends Node

var is_player_busy = false

var TestText : Dictionary = {
	"0" : {"name" : "MC", "expression" : "none", "text" : "Bom dia, Viyeniya."},
	"1" : {"name" : "OM", "expression" : "none", "text" : "Bom dia, Viyeniya 2."},
	"2" : {"name" : "YB", "expression" : "none", "text" : "Bom dia, Viyeniya 2."},
	"3" : {"name" : "AW", "expression" : "none", "text" : "Hm, so weird..."},
	"4" : {"name" : "EXEC_DIALOG", "expression" : "none", "text" : "TestText2"},
}

var TestText2 : Dictionary = {
	"0" : {"name" : "DM", "expression" : "none", "text" : "Test Text 1."},
	"1" : {"name" : "DM", "expression" : "none", "text" : "Alalele"},
}

var DialogTable : Dictionary = {
	"TestText" : TestText,
	"TestText2" : TestText2
}
