extends CharacterBody2D
class_name Snake

func _physics_process(delta):
	move_and_slide()

	if velocity.length() > 0:
		$AnimatedSprite2D.play("walk")
	
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
