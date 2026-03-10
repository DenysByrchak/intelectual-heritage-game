extends Label

func _ready() -> void:
	self.text = ScoreManager.player_2_name
	horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
