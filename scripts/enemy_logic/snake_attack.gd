extends State
class_name SnakeAttack

@export var enemy: CharacterBody2D
@export var animated_sprite: AnimatedSprite2D
@export var move_speed: float = 25.0
@export var retreat_speed: float = 40.0
@export var attack_duration: float = 0.6
@export var retreat_duration: float = 0.5
@export var approach_distance: float = 20.0


var player: CharacterBody2D
var attack_direction: Vector2

enum Phase {
	APPROACH,
	WINDUP,
	RETREAT
}

var phase: Phase
var timer: float = 0.0


func enter(body):
	print("Snake Attacking")
	player = body
	
	if not enemy or not player:
		return
	
	phase = Phase.APPROACH



func physics_update(delta: float):
	if not enemy or not player:
		return
	
	match phase:
		
		# Phase 1: Move toward player
		Phase.APPROACH:
			var direction = player.global_position - enemy.global_position
			direction.y = 0
			
			if direction.length() > approach_distance:
				enemy.velocity = direction.normalized() * move_speed
			else:
				# Stop moving
				enemy.velocity = Vector2.ZERO
				
				# Lock attack direction
				attack_direction = direction.normalized()
				
				# Start attack animation
				phase = Phase.WINDUP
				timer = attack_duration
				
				animated_sprite.play("attack")
				
				# Enable attack collision
				enemy.body_hitbox.monitoring = true
				enemy.body_hitbox.scale = Vector2(2.2, 2.2)
				enemy.head_hitbox.scale = Vector2(1.5, 1.5)
		
		# Phase 2: Stop and attack
		Phase.WINDUP:
			enemy.velocity = Vector2.ZERO
			timer -= delta
			
			if timer <= 0:
				phase = Phase.RETREAT
				timer = retreat_duration
		
		
		# Phase 3: Retreat backward
		Phase.RETREAT:
			enemy.velocity = -attack_direction * retreat_speed
			
			timer -= delta
			
			if timer <= 0:
				enemy.velocity = Vector2.ZERO
				
				enemy.body_hitbox.monitoring = false
				enemy.body_hitbox.scale = Vector2(1.5, 1.5)
				enemy.head_hitbox.scale = Vector2(1, 1)
				Transitioned.emit(self, "idle", null)
