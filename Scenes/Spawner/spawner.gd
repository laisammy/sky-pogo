extends Node

@export var platformScene: PackedScene

func _enter_tree() -> void: # Start listening to newPlatform event when the game loads in
	SignalHub.newPlatform.connect(_on_new_platform)

func spawn_platform(oldPlatformPos: Vector3) -> void:
	var newPlatform: PlatformA = platformScene.instantiate()
	newPlatform.position = oldPlatformPos + Vector3(5, 10, -5)
	add_child(newPlatform)

func _on_new_platform(platformPos: Vector3) -> void: # Fired when signal is recieved from _enter_tree()
	spawn_platform(platformPos)
