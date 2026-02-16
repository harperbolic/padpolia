extends Node

var SM : String = "Scene Manager: "

var scenes = {
	"main_menu" : "res://scenes/main_menu.tscn",
	"testing" : "res://scenes/testing.tscn",
}

var transition_scene = preload("res://components/UI/transition.tscn")

@onready var scene = load(scenes["main_menu"]).instantiate()
@onready var old_scene = scene

func _ready() -> void:
	print(SM, "Scene 'main_menu' loaded")
	add_child(scene)

func load_scene(scene_str : String) -> void:
	Definitions.is_player_busy = true
	var transition = transition_scene.instantiate()
	add_child(transition)
	transition.fade_in()
	await transition.fade_finished
	old_scene.queue_free()
	scene = load(scenes[scene_str]).instantiate()
	print(SM, "Scene '", scene_str, "' loaded.")
	add_child.call_deferred(scene)
	old_scene = scene
	transition.fade_out()
	await transition.fade_finished
	Definitions.is_player_busy = false
	transition.queue_free()
