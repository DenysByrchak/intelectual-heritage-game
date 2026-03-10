extends Button

@onready var line_edit: LineEdit = $"../LineEdit"
@export var first_level: String = "res://scenes/levels/bible/bible_level_1.tscn"

func _on_pressed() -> void:
	ScoreManager.player_2_name = line_edit.text
	get_tree().change_scene_to_file(first_level)
