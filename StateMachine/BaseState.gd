extends Node

class_name State

@export var character : CharacterBody2D

@export var animation : AnimationPlayer

@onready var statemachine = get_parent()

signal Transitioned

func Enter():
	pass

func Exit():
	pass

func Update(delta:float):
	pass

func Physics_Update(delta:float):
	if character.has_method("handleInput"):
		character.handleInput()
	character.move_and_slide()
