extends Control

@onready var score_label: Label = $MarginContainer/scoreLabel
@onready var best_label: Label = $MarginContainer/bestLabel
@onready var game_over: ColorRect = $gameOver
@onready var new_high_score: Label = $gameOver/VBoxContainer/newHighScore
@onready var keep_it_up: Label = $gameOver/VBoxContainer/keepItUp

var hsr: highScoreResource = highScoreResource.load_or_create()
var currentScore: int = 0

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("reload"):
		get_tree().reload_current_scene()

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
	if hsr.check_and_update(currentScore):
		new_high_score.show()
		keep_it_up.hide()
	game_over.show()
