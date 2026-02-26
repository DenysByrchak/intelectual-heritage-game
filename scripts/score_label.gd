extends Label

func _ready():
	# Set starting text
	text = "Score: " + str(ScoreManager.score)
	position = Vector2(20, 20)
	# Connect to score signal
	ScoreManager.score_changed.connect(_on_score_changed)


func _on_score_changed(new_score):
	text = "Score: " + str(new_score)
