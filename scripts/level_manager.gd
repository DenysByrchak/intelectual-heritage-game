extends Node2D
@onready var player_character_1: CharacterBody2D = $PlayerCharacter1
@onready var player_character_2: CharacterBody2D = $PlayerCharacter2

@export var dialogue : Resource

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not dialogue:
		return
		
	player_character_1.set_physics_process(false)
	player_character_2.set_physics_process(false)
	
	
	DialogueManager.show_dialogue_balloon(dialogue)
	await DialogueManager.dialogue_ended
	
	player_character_1.set_physics_process(true)
	player_character_2.set_physics_process(true)

func restart_level() -> void:
	get_tree().reload_current_scene.call_deferred()
