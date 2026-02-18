extends Area2D

@onready var timer: Timer = $Timer
var active := false

func _ready():
	await get_tree().create_timer(0.15).timeout
	active = true
	print("Killzone ready")

func _on_body_entered(body):
	print("Killzone hit:", body.name, " Type:", body.get_class())
	if not active:
		return
	if body.is_in_group("Player"):
		print("You died")
		Engine.time_scale = 0.5
		body.queue_free()
		timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
