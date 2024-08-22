extends CharacterBody3D

const SPEED = 5.0
@export var speed := 8.0
@export var jump_height := 1.0
@export var fall_multiplier := 2.5
@export var max_hitpoints := 100
@export var aim_multiplier := 0.65

@onready var camera_pivot: Node3D = $CameraPivot
@onready var game_over_menu: Control = $GameOverMenu
#@onready var win_game_menu: Control = $WinGameMenu
@onready var damage_animation_player: AnimationPlayer = $DamageAnimationPlayer
@onready var ammo_handler: AmmoHandler = %AmmoHandler
@onready var smooth_camera: Camera3D = %SmoothCamera
@onready var weapon_camera: Camera3D = %WeaponCamera

# need an onready here for startup
@onready var smooth_camera_fov := smooth_camera.fov
@onready var weapon_camera_fov := weapon_camera.fov

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
var mouse_motion := Vector2.ZERO
var mouse_sensitivity := 0.001
var hitpoints := max_hitpoints:
	set(value):
		if (value < hitpoints):
			damage_animation_player.stop()
			damage_animation_player.play("takeDamage")
		hitpoints = value

		if hitpoints <= 0:
			game_over_menu.game_over()

# process for input actions, loop
func _process(delta: float) -> void:
	if Input.is_action_pressed("aim"):
		smooth_camera.fov = lerp(smooth_camera.fov, smooth_camera_fov * aim_multiplier, delta * 15.0)
		weapon_camera.fov = lerp(weapon_camera.fov, weapon_camera_fov * aim_multiplier, delta * 15.0)
	else:
		smooth_camera.fov = lerp(smooth_camera.fov, smooth_camera_fov, delta * 25.0)
		weapon_camera.fov = lerp(weapon_camera.fov, weapon_camera_fov, delta * 25.0)

	#if finished_game:
		#print('finished game? ', str(finished_game))
		#win_game_menu.win_game()

func _ready() -> void:
	# Capture the mouse to the center of the window
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta: float) -> void:
	handle_camera_rotation()
	# Add the gravity.
	if not is_on_floor():
		if velocity.y >= 0:
			velocity.y -= gravity * delta
		else:
			velocity.y -= gravity * delta * fall_multiplier

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = sqrt(jump_height * 2 * gravity)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		if Input.is_action_pressed("aim"):
			velocity.x *= aim_multiplier
			velocity.z *= aim_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()

func _input(event: InputEvent) -> void:

	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		mouse_motion = -event.relative * mouse_sensitivity
		if Input.is_action_pressed("aim"):
			mouse_motion *= aim_multiplier
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func handle_camera_rotation() -> void:
	rotate_y(mouse_motion.x)
	camera_pivot.rotate_x(mouse_motion.y)
	camera_pivot.rotation_degrees.x = clampf(
		camera_pivot.rotation_degrees.x,
		-85.0,
		85.0
	)
	mouse_motion = Vector2.ZERO


