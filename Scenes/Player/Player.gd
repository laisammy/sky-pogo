extends CharacterBody3D

class_name Player

@onready var anim_player: AnimationPlayer = $AnimationPlayer

const GRAVITY: float = 50.0
const JUMP_FORCE: float = 30.0
const ROTATION_SPEED: float = 10.0
const MOVE_SPEED: float = 10.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

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
		direction += Vector3.FORWARD
	if Input.is_action_pressed("down"):
		direction += Vector3.BACK
	if Input.is_action_pressed("left"):
		direction += Vector3.LEFT
	if Input.is_action_pressed("right"):
		direction += Vector3.RIGHT

	velocity.x = direction.x * MOVE_SPEED
	velocity.z = direction.z * MOVE_SPEED

	
func handle_gravity(delta: float) -> void:
	if is_on_floor():
		velocity.y = JUMP_FORCE
	else:
		velocity.y -= GRAVITY * delta
		
func handle_animation() -> void:
	if velocity.y > 0:
		anim_player.play("jump")
	else:
		anim_player.play("fall")
