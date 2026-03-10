extends Node2D

func _ready() -> void:
	var entry_name: String = ScoreManager.player_1_name + " and " + ScoreManager.player_2_name
	SilentWolf.Scores.save_score(entry_name, ScoreManager.score)
