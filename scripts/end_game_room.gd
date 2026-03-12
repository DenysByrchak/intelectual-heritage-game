extends Node2D

@export var next_level : String = "res://scenes/main_menu.tscn"

func _ready() -> void:
	SilentWolf.init_config()
	
	await get_tree().process_frame
	
	var entry_name: String = ScoreManager.player_1_name + " and " + ScoreManager.player_2_name

	var sw_result = await SilentWolf.Scores.save_score(entry_name, ScoreManager.score).sw_save_score_complete
	print(sw_result)
	
func _back_to_menu() -> void:
	var tree = get_tree()
	await tree.create_timer(5.0).timeout
	tree.change_scene_to_file(next_level)
