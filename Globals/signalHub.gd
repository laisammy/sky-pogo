extends Node

signal newPlatform(platformPos: Vector3)
signal newPlayerPos(playerPos: Vector3)
signal spawner_loaded(yPos: float)
signal new_height_reached(height: float)
signal gameOver

func emit_new_platform(platformPos: Vector3) -> void:
	newPlatform.emit(platformPos) # Sends signal to spawner.gd and game.gd

func emit_player_position(playerPos: Vector3) -> void:
	newPlayerPos.emit(playerPos) # Sends signal to playerCamera.gd 

func emit_spawner_loaded(yPos: float) -> void:
	spawner_loaded.emit(yPos) # Sends signal to player.gd

func emit_new_height_reached(height: float) -> void:
	new_height_reached.emit(height)
	
func emit_game_over() -> void:
	gameOver.emit()
