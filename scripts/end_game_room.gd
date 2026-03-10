extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SilentWolf.Scores.save_score("test name", ScoreManager.score)
