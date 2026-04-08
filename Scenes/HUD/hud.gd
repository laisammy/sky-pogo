extends Control

@onready var score_label: Label = $MarginContainer/scoreLabel
@onready var best_label: Label = $MarginContainer/bestLabel

var hsr: highScoreResource = highScoreResource.load_or_create()
var currentScore: int = 0

func _enter_tree() -> void:
	SignalHub.new_height_reached.connect(new_height_reached)
	SignalHub.gameOver.connect(gameOver)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	best_label.text = "Best Score: " + str(hsr.highScore)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func new_height_reached(height: float) -> void:
	currentScore = int(height)
	score_label.text = "Current Score: " + str(currentScore)
	
func gameOver() -> void:
	hsr.check_and_update(currentScore)
