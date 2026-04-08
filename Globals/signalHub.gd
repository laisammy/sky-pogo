extends Node

signal newPlatform(platformPos: Vector3)
signal newPlayerPos(playerPos: Vector3)
signal spawner_loaded(yPos: float)

func emit_new_platform(platformPos: Vector3) -> void:
	newPlatform.emit(platformPos) # Sends signal to spawner.gd and game.gd

func emit_player_position(playerPos: Vector3) -> void:
	newPlayerPos.emit(playerPos) # Sends signal to playerCamera.gd 

func emit_spawner_loaded(yPos: float) -> void:
	spawner_loaded.emit(yPos) # Sends signal to player.gd
