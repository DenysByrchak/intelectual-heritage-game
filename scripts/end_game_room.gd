extends Node2D

func _ready() -> void:
	SilentWolf.configure({
		"api_key": "Qn6euIZpmq6c1Nln36bMya0DCEvQzeuu5Zs5AFai",
		"game_id": "IHGame",
		"log_level": 1
	})
	await get_tree().process_frame
	
	var entry_name: String = ScoreManager.player_1_name + " and " + ScoreManager.player_2_name

	var sw_result = await SilentWolf.Scores.save_score(entry_name, ScoreManager.score).sw_save_score_complete
	print(sw_result)
