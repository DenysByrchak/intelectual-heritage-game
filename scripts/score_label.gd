extends Label
@onready var sprite_2d: Sprite2D = $"../Sprite2D"

func _ready():
	# Set starting text
	text = "Score: " + str(ScoreManager.score)
	position = Vector2(20, 20)
	sprite_2d.position = position + Vector2(48, 11)
	# Connect to score signal
	ScoreManager.score_changed.connect(_on_score_changed)


func _on_score_changed(new_score):
	text = "Score: " + str(new_score)
