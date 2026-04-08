extends Node

signal newPlatform(platformPos: Vector3)
signal newPlayerPos(playerPos: Vector3)

func emit_new_platform(platformPos: Vector3) -> void:
	newPlatform.emit(platformPos) # Sends signal to spawner.gd

func emit_player_position(playerPos: Vector3) -> void:
	newPlayerPos.emit(playerPos) # Sends signal to playerCamera.gd 
