extends State
class_name EnemyFollow

@export var enemy: CharacterBody2D
@export var move_speed := 10.0

var player: CharacterBody2D

#player(s) needs to be in a group called "Player"
func enter():
	if not player:
		var players = get_tree().get_nodes_in_group("Player")
		if players.size() > 0:
			player = players[0] as CharacterBody2D

func physics_update(_delta: float):
	
	if not enemy or not player:
		return

	var direction = player.global_position - enemy.global_position
	direction.y = 0
	
	if direction.length() > 25:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2()
		
	if direction.length() > 100:
		print("Idle")
		Transitioned.emit(self, "idle")
