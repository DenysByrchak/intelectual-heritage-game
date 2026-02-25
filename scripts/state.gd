extends Node
class_name State

signal Transitioned(state, new_state_name, body)

func enter(_body):
	pass

func exit():
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass
