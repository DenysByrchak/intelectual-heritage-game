extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -340.0

@export var jump: String = "p1_up"
@export var left: String = "p1_left"
@export var right: String = "p1_right"

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

signal dead

func _physics_process(delta: float) -> void:
	
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Jump input
	if Input.is_action_just_pressed(jump) and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_sprite_2d.play("jump")   

	# Movement
	var direction := Input.get_axis(left, right)

	if direction != 0:
		velocity.x = direction * SPEED
		animated_sprite_2d.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if not is_on_floor():
		animated_sprite_2d.play("jump")
	elif direction != 0:
		animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("idle")

	move_and_slide()

func die():
	ScoreManager.score -= 2
	dead.emit()
	queue_free()
