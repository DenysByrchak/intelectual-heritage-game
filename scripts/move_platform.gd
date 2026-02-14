extends Node2D
@onready var platform_path: Path2D = $PlatformPath
@onready var path_follow_2d: PathFollow2D = $PlatformPath/PathFollow2D

@export var speed : float = 0.5

func _ready() -> void:
	if platform_path.curve == null:
		set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	path_follow_2d.progress_ratio += speed * delta
	if path_follow_2d.progress_ratio == 1 || path_follow_2d.progress_ratio == 0:
		speed *= -1
