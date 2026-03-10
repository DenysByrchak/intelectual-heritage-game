extends Label

func _ready() -> void:
	self.text = ScoreManager.player_1_name
	horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
