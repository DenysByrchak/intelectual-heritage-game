extends Node2D

@onready var timer: Timer = $Timer
@export var next_level: PackedScene

var bodies: int = 0

func _on_door_area_body_exited(_body: Node2D) -> void:
	bodies -= 1
	timer.stop()
	


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_packed(next_level)


func _on_door_area_body_entered(_body: Node2D) -> void:
	bodies += 1
	if bodies == 2:
		timer.start()
