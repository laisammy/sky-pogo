extends Node

@export var platformScenes: Array[PackedScene]
@onready var platform_a: PlatformA = $PlatformA
@onready var floor: Area3D = $"../Floor"

const OFFSET_UP: Vector2 = Vector2(5, 8)
const OFFSET_SIDE: Vector2 = Vector2(2, 4)

func _ready() -> void:
	SignalHub.emit_spawner_loaded(platform_a.position.y) # Send signal to signalHub.gd

func _enter_tree() -> void: # Start listening to newPlatform event when the game loads in
	SignalHub.newPlatform.connect(_on_new_platform)
	
func get_random_offset(offset_range: Vector2) -> float:
	if randf() < 0.5:
		return randf_range(-offset_range.y, -offset_range.x)
	else:
		return randf_range(offset_range.x, offset_range.y)

func spawn_platform(oldPlatformPos: Vector3) -> void:
	if platformScenes.size() == 0:
		return
	
	var platformScene = platformScenes.pick_random()
	var newPlatform: PlatformA = platformScene.instantiate()
	
	var randomY: float = randf_range(OFFSET_UP.x, OFFSET_UP.y)
	var randomX: float = get_random_offset(OFFSET_SIDE)
	var randomZ: float = get_random_offset(OFFSET_SIDE)
	
	newPlatform.position = oldPlatformPos + Vector3(randomX, randomY, randomZ)
	add_child(newPlatform)
	
	floor.position.y += 5

func _on_new_platform(platformPos: Vector3) -> void: # Fired when signal is recieved from _enter_tree()
	spawn_platform(platformPos)
