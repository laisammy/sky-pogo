extends CharacterBody3D

class_name Player

@onready var anim_player: AnimationPlayer = $AnimationPlayer

const GRAVITY: float = 15.0
const JUMP_FORCE: float = 20.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	handle_gravity(delta)
	move_and_slide()
	handle_animation()
	
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
