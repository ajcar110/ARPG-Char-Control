extends Label

@onready var statemachine = $"../StateMachine"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = statemachine.current_state.name
