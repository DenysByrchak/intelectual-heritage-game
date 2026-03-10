extends Button
@onready var line_edit: LineEdit = $"../LineEdit"
@onready var p_1_name_box: VBoxContainer = $".."

@onready var p_2_name_box: VBoxContainer = $"../../P2NameBox"

func _on_pressed() -> void:
	ScoreManager.player_1_name = line_edit.text
	p_1_name_box.hide()
	p_2_name_box.show()
