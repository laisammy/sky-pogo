extends CharacterBody3D

class_name Player

const GRAVITY: float = 15.0
const JUMP_FORCE: float = 20.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	if is_on_floor():
		velocity.y = JUMP_FORCE
	else:
		velocity.y -= GRAVITY * delta
	move_and_slide()
