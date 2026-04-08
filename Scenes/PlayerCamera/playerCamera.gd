extends Camera3D

@export var buffer: Vector3 = Vector3(0, 16, 16)
@export var smoothSpeed: float = 2.0

var basePosition: Vector3

func _enter_tree() -> void: # Start listening to newPlatform event when the game loads in
	SignalHub.newPlayerPos.connect(_on_player_pos)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	basePosition = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = position.lerp(basePosition, smoothSpeed * delta)

func _on_player_pos(playerPos: Vector3) -> void:
	print("newPlayerPos")
	print(playerPos)
	basePosition = playerPos + buffer

#func _on_new_platform(platformPos: Vector3) -> void: # Fired when signal is recieved from _enter_tree()
	#basePosition = platformPos + buffer
	
