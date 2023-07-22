extends BaseState

class_name BlankState

func enter(params={}):
	print("NO STATE FUNCTIONALITY")

func physics_process(delta: float) -> BaseState:
	return character.states.idle_state
