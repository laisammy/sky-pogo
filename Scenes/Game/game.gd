extends Node

func _ready() -> void:
	get_tree().paused = false

func _on_floor_body_entered(body: Node3D) -> void:
	if body is Player:
		SignalHub.emit_game_over()
		get_tree().paused = true
