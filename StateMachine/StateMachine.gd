extends Node


var current_state: State
var states: Dictionary = {}

@export var InitialState:State

func _ready():
	for child in get_children():
		states[child.name.to_lower()] = child
		child.Transitioned.connect(on_state_transition)
	if InitialState:
		InitialState.Enter()
		current_state = InitialState

func _process(delta):
	if current_state:
		current_state.Update(delta)

func _physics_process(delta):
	if current_state:
		current_state.Physics_Update(delta)


#Called by signal on transition
func on_state_transition(state, new_state_name):
	if state != current_state:
		return

	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	if current_state:
		current_state.Exit()
	
	new_state.Enter()
	
	current_state = new_state
