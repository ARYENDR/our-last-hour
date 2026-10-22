extends CharacterBody2D

enum PLAYER_STATES {WALKING, SPRINTING, JUMPING, FALLING, CLIMBING, DASHING, STILL}
var player_state: PLAYER_STATES = PLAYER_STATES.STILL
var player_vert_state: PLAYER_STATES = PLAYER_STATES.STILL

var direction: Vector2 = Vector2(1,-1)
var speed = 8
var jump_power = 500
var y_velocity = 1.0


func input_movement(delta):
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		if Input.is_action_pressed("ui_left"):
			direction.x = -1
		elif Input.is_action_pressed("ui_right"):
			direction.x = 1
		
		if Input.is_action_just_pressed("x"):
			player_state = PLAYER_STATES.DASHING
		else:
			player_state = PLAYER_STATES.WALKING
	else: player_state = PLAYER_STATES.STILL
		
	if Input.is_action_pressed("ui_up") and is_on_wall():
		player_vert_state = PLAYER_STATES.CLIMBING
		direction.y = 0
	elif Input.is_action_just_released("ui_up") and is_on_wall():
		player_vert_state = PLAYER_STATES.JUMPING
		direction.y = 1
	elif Input.is_action_just_pressed("ui_up") and is_on_floor():
		player_vert_state = PLAYER_STATES.JUMPING
		direction.y = 1
	elif !is_on_floor():
		print("NOT ON FLOOR BOY")
		player_vert_state = PLAYER_STATES.FALLING
		direction.y = -1
	else:
		player_vert_state = PLAYER_STATES.STILL
		direction.y = 0
	
	movement(delta)

func movement(delta):
	match player_state:
		PLAYER_STATES.WALKING:
			position.x += speed * direction.x * (delta * 50)
	match player_vert_state:
		PLAYER_STATES.JUMPING:
			velocity.y -= jump_power
		PLAYER_STATES.FALLING:
			velocity.y += Global.gravity
		PLAYER_STATES.CLIMBING:
			velocity.y = 0

func _process(delta: float) -> void:
	input_movement(delta)
	
	move_and_slide()
