extends Node

signal score_changed(new_socre)

var player_1_name: String = "Player 1"
var player_2_name: String = "Player 2"

var score: int:
	set(value):
		score = value
		emit_signal("score_changed", score)
	get:
		return score
