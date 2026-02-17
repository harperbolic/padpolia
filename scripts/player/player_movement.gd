extends CharacterBody2D
class_name Player

const SPEED = 3700.0
var direction : Vector2
var target
var click : Vector2

@onready var animation_player = $AnimatedSprite2D
@onready var nav_agent = $NavigationAgent2D as NavigationAgent2D

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click"):
		click = get_global_mouse_position()
		target = click
		makepath()
	
	if target and not Definitions.is_player_busy and not Dialog.is_dialog_active:
		if position > (target + Vector2(1, 1)) or position < (target - Vector2(1, 1)):
			direction = to_local(nav_agent.get_next_path_position()).normalized()
			velocity = direction * SPEED * delta
		else:
			velocity = Vector2(0, 0)
			
	if velocity.length() > 0:
		animation_player.play("walk")
	else:
		animation_player.play("default")
	
	if velocity.x > 0:
		animation_player.flip_h = false
	elif velocity.x < 0:
		animation_player.flip_h = true
	
	if Definitions.is_player_busy:
		velocity = Vector2(0, 0)
	
	move_and_slide()

func makepath() -> void:
	nav_agent.target_position = target
