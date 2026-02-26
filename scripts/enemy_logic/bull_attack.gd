extends State
class_name BullAttack

@export var enemy: CharacterBody2D
@export var animated_sprite: AnimatedSprite2D

@export var approach_speed: float = 120.0
@export var acceleration: float = 900.0
@export var max_speed: float = 500.0
@export var ram_duration: float = 0.6
@export var recover_duration: float = 0.8
@export var prepare_duration: float = 0.4
@export var backoff_speed: float = 150.0
@export var attack_range: float = 200.0

var player: CharacterBody2D
var charge_direction: Vector2 = Vector2.ZERO
var current_velocity: Vector2 = Vector2.ZERO

enum Phase {
	APPROACH,
	PREPARE,
	CHARGE,
	RAM,
	RECOVER
}

var phase: Phase
var timer: float = 0.0


func enter(body):
	#print("Attacking")
	player = body
	
	phase = Phase.APPROACH
	current_velocity = Vector2.ZERO
	timer = 0.0
	
	
func physics_update(delta: float):
	
	match phase:
		
		# Move toward player first
		Phase.APPROACH:
			var direction = player.global_position - enemy.global_position
			direction.y = 0
			
			if direction.length() > attack_range:
				enemy.velocity = direction.normalized() * approach_speed
			else:
				start_prepare()
		
		
		# Stop and prepare attack
		Phase.PREPARE:
			timer -= delta
			enemy.velocity = Vector2.ZERO
			
			if timer <= 0:
				start_charge()
		
		
		# Accelerate toward player
		Phase.CHARGE:
			current_velocity += charge_direction * acceleration * delta
			
			if current_velocity.length() >= max_speed:
				current_velocity = charge_direction * max_speed
				start_ram()
			
			enemy.velocity = current_velocity
		
		
		# Ram forward at max speed
		Phase.RAM:
			timer -= delta
			enemy.velocity = charge_direction * max_speed
			
			if timer <= 0:
				start_recover()
		
		
		# Back off after ram
		Phase.RECOVER:
			timer -= delta
			enemy.velocity = -charge_direction * backoff_speed
			
			if timer <= 0:
				Transitioned.emit(self, "idle", null)
				
func start_prepare():
	phase = Phase.PREPARE
	timer = prepare_duration
	enemy.velocity = Vector2.ZERO
	current_velocity = Vector2.ZERO
	
	charge_direction = player.global_position - enemy.global_position
	charge_direction.y = 0
	charge_direction = charge_direction.normalized()
	



func start_charge():
	phase = Phase.CHARGE
	current_velocity = Vector2.ZERO



func start_ram():
	phase = Phase.RAM
	timer = ram_duration



func start_recover():
	phase = Phase.RECOVER
	timer = recover_duration
