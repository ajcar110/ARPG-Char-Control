extends MoveState


var friction = .7

var move

func enter() -> void:
	super.enter()
	move = get_movement_input()

func input(event: InputEvent) -> BaseState:
	return null


func physics_process(delta: float) -> BaseState:
	if move == Vector2.ZERO:
		move = direction_arr[character.facing_index]
	character.velocity *= friction
	character.move_and_slide()
	
	if character.velocity.is_zero_approx():
		return idle_state
	return null
