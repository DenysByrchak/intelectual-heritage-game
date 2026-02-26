extends State
class_name EnemyIdle

@export var enemy: CharacterBody2D
@export var move_speed : float =  15.0

var move_direction : Vector2
var wander_time : float

func randomize_wander():
	move_direction = Vector2(randf_range(-1, 1), 0).normalized()
	wander_time = randf_range(1,3)
	
func enter(_body):
	#print("Idle")
	randomize_wander()
	
func update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()
	
	enemy.velocity = move_direction * move_speed



func _on_detection_area_body_entered(body: Node2D) -> void:
	Transitioned.emit(self, "follow", body)
