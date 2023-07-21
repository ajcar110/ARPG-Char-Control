extends MoveState

@export var fall_node: NodePath

@onready var fall_state:BaseState = get_node(fall_node)

var dash_distance: int = 4 * Global.TILESIZE
var dash_start : Vector2
var move

# Upon entering the state, set dash direction to either current input or the direction the player is facing if no input is pressed
func enter() -> void:
	super.enter()
	move = get_movement_input()
	dash_start = character.position

# Override MoveState input() since we don't want to change states based on player input
func input(event: InputEvent) -> BaseState:
	return null


# Track how long we've been dashing so we know when to exit
func physics_process(delta: float) -> BaseState:
	if move == Vector2.ZERO:
		move = direction_arr[character.facing_index]
	character.velocity = move * (character.dash_speed * Global.TILESIZE)
	character.move_and_slide()
	if character.is_on_wall() or character.is_on_ceiling() or character.is_on_floor():
		return fall_state
	if character.position.distance_to(dash_start) > dash_distance:
		return fall_state

	return null
