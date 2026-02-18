extends CharacterBody2D
class_name Snake

@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	move_and_slide()

	if velocity.length() > 0:
		animated_sprite.play("walk")
	
	if velocity.x > 0:
		animated_sprite.flip_h = false
	else:
		animated_sprite.flip_h = true
