extends Label

@export var StateMachine: Node

func _physics_process(delta):
	if StateMachine.current_state:
		self.text = StateMachine.current_state.name
