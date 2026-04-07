extends Node3D
@onready var anim_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	anim_player.play("vanish")
	_on_animation_player_animation_finished("vanish")
	


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
