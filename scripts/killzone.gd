extends Area2D

func _on_body_entered(body):
	print("Killzone hit: ", body.name, " Type: ", body.get_class())
	ScoreManager.reset_score()
	body.die()
