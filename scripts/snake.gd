extends CharacterBody2D
class_name Snake

var is_dead: bool = false

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var body_hitbox: Area2D = $BodyHitbox
@onready var detection_area: Area2D = $DetectionArea
@onready var head_hitbox: Area2D = $HeadHitbox

func _physics_process(delta): 
		# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta * 50
		
	move_and_slide() 
	if velocity.length() > 0: 
		animated_sprite.play("walk") 
	if velocity.x > 0: 
		animated_sprite.flip_h = false 
	else: 
		animated_sprite.flip_h = true

func _on_head_hitbox_body_entered(body: Node2D) -> void:
	if is_dead:
		return
		
	if body.velocity.y > 0:
		print("Snake Died")
		die()
		body.velocity.y = -300


func _on_body_hitbox_body_entered(body: Node2D) -> void:
	if is_dead:
		return
	print("Snake Killed")	
	body.die()


func die() -> void:
	if is_dead:
		return
		
	is_dead = true
	ScoreManager.score += 1
	animated_sprite.play("death")
	set_physics_process(false)
	
	body_hitbox.set_deferred("monitoring", false)
	head_hitbox.set_deferred("monitoring", false)
	detection_area.set_deferred("monitoring", false)
