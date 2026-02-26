extends State
class_name EnemyFollow

@export var enemy: CharacterBody2D
@export var move_speed : float = 25.0

var player: CharacterBody2D

func enter(body):
	#print("Following")
	player = body

func physics_update(_delta: float):

	var direction = player.global_position - enemy.global_position
	direction.y = 0
	
	if direction.length() < 100:
		Transitioned.emit(self, "attack", player)
		
	if direction.length() > 10:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2()
		
	if direction.length() > 300:
		Transitioned.emit(self, "idle", null)
