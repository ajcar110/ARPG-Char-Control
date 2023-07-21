class_name MoveState
extends BaseState

@export var move_speed: int = 3

var direction_arr = [Vector2.RIGHT, Vector2(0.707107, 0.707107), Vector2.DOWN, Vector2(-0.707107, 0.707107),
					 Vector2.LEFT, Vector2(-0.707107, -0.707107), Vector2.UP, Vector2(0.707107, -0.707107)]

func input(event: InputEvent) -> BaseState:
	if Input.is_action_just_pressed("atk"):
		return character.states.attack_state
	
	if Input.is_action_just_pressed("dash"):
		return character.states.dash_state

	return null

func physics_process(delta: float) -> BaseState:
	var direction = get_movement_input()
	character.set_facing(direction)
	if facing != character.facing:
		character.animations.play(animation_name + character.facing)
		facing = character.facing
	var move = direction_arr[character.facing_index]
	character.velocity  = move * (character.speed * Global.TILESIZE)
	character.move_and_slide()
	if direction == Vector2.ZERO:
		return character.states.idle_state

	return null

func get_movement_input() -> Vector2:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	return direction
