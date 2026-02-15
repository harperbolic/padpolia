extends CharacterBody2D

const SPEED = 4000.0
var direction : Vector2
var target = Vector2(0, 0)
var click : Vector2

@onready var animation_player = $AnimatedSprite2D
@onready var nav_agent = $NavigationAgent2D as NavigationAgent2D

func _ready() -> void:
	makepath()

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("left_click"):
		click = get_global_mouse_position()
		target = (click - global_position).normalized()
		print(target)
		makepath()
	
	direction = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = direction * SPEED * delta
	
	if velocity.length() > 0:
		animation_player.play("walk")
	else:
		animation_player.play("default")
	
	if velocity.x > 0:
		animation_player.flip_h = false
	elif velocity.x < 0:
		animation_player.flip_h = true
	
	move_and_slide()

func makepath() -> void:
	nav_agent.target_position = target
