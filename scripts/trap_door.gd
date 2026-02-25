extends Node2D

@onready var timer: Timer = $Timer
@export var enemy: PackedScene
@onready var label: Label = $Label

@onready var collision_shape_2d: CollisionShape2D = $DoorArea/CollisionShape2D

var bodies: int = 0

func _on_door_area_body_exited(body: Node2D) -> void:
	bodies -= 1
	timer.stop()
	


func _on_timer_timeout() -> void:
	var enemy_amount = randi_range(1,2)
	var enemy_offset : int = 0
	
	for i in range(enemy_amount):
		enemy_offset = randi_range(-100, 100)
		
		var new_enemy = enemy.instantiate()
		new_enemy.position.x += enemy_offset
		new_enemy.position.y -= 100
		add_child(new_enemy)
		
	collision_shape_2d.disabled = true
	bodies = 0
	label.hide()

func _on_door_area_body_entered(body: Node2D) -> void:
	bodies += 1
	if bodies == 2:
		timer.start()
