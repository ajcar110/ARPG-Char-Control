extends Node

class_name StateMachine

@export var starting_state: NodePath



var current_state: BaseState

func change_state(new_state: BaseState, params={}) -> void:
	if current_state:
		current_state.exit()

	current_state = new_state
	current_state.enter(params)

# Initialize the state machine by giving each state a reference to the objects
# owned by the parent that they should be able to take control of
# and set a default state
func init(character: Entity) -> void:
	for child in get_children():
		child.character = character
		child.connect("interupt_state", on_state_interupt_state)

	# Initialize with a default state of idle
	change_state(get_node(starting_state))
	
# Pass through functions for the Player to call,
# handling state changes as needed
func physics_process(delta: float) -> void:
	var new_state = current_state.physics_process(delta)
	if new_state:
		change_state(new_state)

func input(event: InputEvent) -> void:
	var new_state = current_state.input(event)
	if new_state:
		change_state(new_state)

func process(delta: float) -> void:
	var new_state = current_state.process(delta)
	if new_state:
		change_state(new_state)

func on_state_interupt_state(new_state: BaseState, params={}):
	change_state(new_state, params)
