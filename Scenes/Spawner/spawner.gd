extends Node

@export var platformScene: PackedScene

func spawn_platform(oldPlatformPos: Vector3) -> void:
	var newPlatform: PlatformA = platformScene.instantiate()
	newPlatform.position = oldPlatformPos + Vector3(2, 5, -2)
	add_child(newPlatform)

func _on_new_platform(platformPos: Vector3) -> void: # Fired when signal is recieved from platform.gd
	spawn_platform(platformPos)
