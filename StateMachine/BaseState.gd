class_name BaseState
extends Node

@export var animation_name: String

@export var character :Entity

var facing

signal interupt_state(new_state: BaseState, params: Dictionary)

func enter(params={}) -> void:
	character.animations.play(animation_name + character.facing)

func exit() -> void:
	pass

func input(event: InputEvent) -> BaseState:
	return null

func process(delta: float) -> BaseState:
	return null

func physics_process(delta: float) -> BaseState:
	return null
