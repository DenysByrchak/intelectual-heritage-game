extends TextureButton

@onready var leaderboard: VBoxContainer = $"../leaderboard"

@onready var p_1_name_box: VBoxContainer = $"../P1NameBox"

func _on_pressed() -> void:
	leaderboard.hide()
	self.hide()
	p_1_name_box.show()
