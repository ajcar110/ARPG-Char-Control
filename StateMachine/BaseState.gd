extends Node

class_name State

@export var character : CharacterBody2D

@export var animation : AnimatedSprite2D

signal Transitioned

func Enter():
	pass

func Exit():
	pass

func Update(delta:float):
	pass

func Physics_Update(delta:float):
	character.handleInput()
	character.move_and_slide()
