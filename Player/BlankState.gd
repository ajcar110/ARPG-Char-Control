extends BaseState


func enter():
	print("NO STATE FUNCTIONALITY")

func physics_process(delta: float) -> BaseState:
	return character.states.idle_state