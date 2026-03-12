extends VBoxContainer
@onready var data_label: Label = $DataLabel

func _ready() -> void:
	SilentWolf.init_config()
	await get_tree().process_frame
	
	var sw_result: Dictionary = await SilentWolf.Scores.get_scores().sw_get_scores_complete
	var text := ""

	for s in sw_result["scores"]:
		text += "%s: %d\n" % [s["player_name"], s["score"]]

	data_label.text = text
