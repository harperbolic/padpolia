extends Control

@onready var MenuPanel = $Menu
@onready var OptionPanel = $Options
@onready var SavePanel = $Save

func _ready() -> void:
	MenuPanel.visible = true
	OptionPanel.visible = false
	SavePanel.visible = false
	
	Dialog.start_dialog(Definitions.TestText, true)


func _on_start_pressed() -> void:
	SceneManager.load_scene("testing")
	MenuPanel.visible = false
	OptionPanel.visible = false
	SavePanel.visible = true

func _on_options_pressed() -> void:
	MenuPanel.visible = false
	OptionPanel.visible = true
	SavePanel.visible = false

func _on_back_pressed() -> void:
	MenuPanel.visible = true
	OptionPanel.visible = false
	SavePanel.visible = false

func _on_quit_pressed() -> void:
	get_tree().quit()
