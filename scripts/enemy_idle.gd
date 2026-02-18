extends State
class_name EnemyIdle

@export var enemy: CharacterBody2D
@export var move_speed = 20.0

var player : CharacterBody2D

var move_direction : Vector2
var wander_time : float

func randomize_wander():
	move_direction = Vector2(randf_range(-1, 1), 0).normalized()
	wander_time = randf_range(1,3)
	
func enter():
	if not player:
		var players = get_tree().get_nodes_in_group("Player")
		if players.size() > 0:
			player = players[0] as CharacterBody2D
	randomize_wander()
	
func update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()

func physics_update(delta: float):
	if enemy:
		enemy.velocity = move_direction * move_speed
		
	var direction = player.global_position - enemy.global_position
	
	if direction.length() < 50:
		print("Follow")
		Transitioned.emit(self, "Follow")
	
