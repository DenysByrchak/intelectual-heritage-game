extends Camera2D

@export var move_speed: float = 5.0
@export var zoom_speed: float = 5.0

@export var min_zoom: float = 0.5
@export var max_zoom: float = 2.0

@export var margin: Vector2 = Vector2(200, 150)

@export var targets: Array[CharacterBody2D] = []
var existing_target : CharacterBody2D

func _process(delta: float) -> void:
	
	if targets.is_empty():
		return
	
	var center: Vector2 = Vector2.ZERO
	for target: CharacterBody2D in targets:
		if target:
			existing_target = target
			center += target.global_position
	
	center /= float(targets.size())
	
	global_position = global_position.lerp(center, move_speed * delta)
	
	var rect: Rect2 = Rect2(existing_target.global_position, Vector2.ZERO)
	for target: CharacterBody2D in targets:
		if target:
			rect = rect.expand(target.global_position)
	
	rect = rect.grow_individual(margin.x, margin.y, margin.x, margin.y)
	
	var screen_size: Vector2 = get_viewport_rect().size
	
	var zoom_x: float = rect.size.x / screen_size.x
	var zoom_y: float = rect.size.y / screen_size.y
	
	var target_zoom: float = max(zoom_x, zoom_y)
	target_zoom = clamp(target_zoom, min_zoom, max_zoom)
	
	zoom = zoom.lerp(Vector2.ONE * target_zoom, zoom_speed * delta)
