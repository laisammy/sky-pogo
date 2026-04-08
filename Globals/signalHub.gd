extends Node

signal newPlatform(platformPos: Vector3)

func emit_new_platform(platformPos: Vector3) -> void:
	newPlatform.emit(platformPos)
