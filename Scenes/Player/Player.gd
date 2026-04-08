extends CharacterBody3D

class_name Player

@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var player_camera: Camera3D = $PlayerCamera
@onready var land_SFX: AudioStreamPlayer3D = $landSFX
@onready var fall_sfx: AudioStreamPlayer3D = $fallSFX

const GRAVITY: float = 50.0
const JUMP_FORCE: float = 30.0
const ROTATION_SPEED: float = 10.0
const MOVE_SPEED: float = 10.0
const LAND_BUFFER: float = 1.0
const FALLEN_OFF_THRESHOLD: float = -60.0

var last_landed: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	last_landed = position.y

func _enter_tree() -> void:
	SignalHub.spawner_loaded.connect(_on_spawner_loaded) # Listens for signals coming from signalHub.gd

func _process(delta: float) -> void:
	SignalHub.emit_player_position(position) # Keep sending signals of the player's current position to signalHub.gd

func _physics_process(delta: float) -> void:
	handle_gravity(delta)
	handle_rotation(delta)
	handle_movement(delta)
	
	move_and_slide()
	handle_animation()
	
func handle_rotation(delta: float) -> void:
	if Input.is_action_pressed("left"):
		rotate_y(ROTATION_SPEED * delta)
	if Input.is_action_pressed("right"):
		rotate_y(-ROTATION_SPEED * delta)
	
func handle_movement(delta: float) -> void:
	var direction := Vector3.ZERO

	if Input.is_action_pressed("up"):
		print("up")
		direction += Vector3.FORWARD
	if Input.is_action_pressed("down"):
		print("down")
		direction += Vector3.BACK
	if Input.is_action_pressed("left"):
		print("left")
		direction += Vector3.LEFT
	if Input.is_action_pressed("right"):
		print("right")
		direction += Vector3.RIGHT

	velocity.x = direction.x * MOVE_SPEED
	velocity.z = direction.z * MOVE_SPEED

func handle_gravity(delta: float) -> void:
	if is_on_floor():
		if position.y > last_landed:
			last_landed = position.y + 1.0
			land_SFX.play()
		velocity.y = JUMP_FORCE
	else:
		velocity.y -= GRAVITY * delta
		
func handle_animation() -> void:
	if velocity.y > 0:
		anim_player.play("jump")
	else:
		anim_player.play("fall")
		if velocity.y < FALLEN_OFF_THRESHOLD and !fall_sfx.playing:
			fall_sfx.play()
		
func _on_spawner_loaded(yPos: float) -> void:
	last_landed = yPos - LAND_BUFFER * 2
