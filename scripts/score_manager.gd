extends Node

signal score_changed(new_socre)

var score: int:
	set(value):
		score = value
		emit_signal("score_changed", score)
	get:
		return score
