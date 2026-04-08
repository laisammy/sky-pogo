extends Resource

class_name highScoreResource

@export var highScore: int = 0

const SCORES_PATH: String = "user://skypogo.tres"

static func load_or_create() -> highScoreResource:
	var hsr: highScoreResource = null
	if ResourceLoader.exists(SCORES_PATH):
		hsr = load(SCORES_PATH)
		if hsr:
			return hsr
	hsr = highScoreResource.new()
	hsr.save()
	return hsr
	
func save() -> void:
	ResourceSaver.save(self, SCORES_PATH)

func check_and_update(score: int) -> bool:
	if score > highScore:
		highScore = score
		save()
		return true
	return false
