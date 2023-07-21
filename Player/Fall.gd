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
	character.velocity = character.velocity.lerp(Vector2.ZERO, .025)
	print(character.velocity)
	character.move_and_slide()
	
	if abs(character.velocity.x) < 70 && abs(character.velocity.y) < 70:
		return idle_state
	return null
