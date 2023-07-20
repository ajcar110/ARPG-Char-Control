class_name MoveState
extends BaseState

@export var move_speed: int = 3
@export var dash_node: NodePath
@export var idle_node: NodePath
@export var walk_node: NodePath
@export var attack_node: NodePath


@onready var idle_state: BaseState = get_node(idle_node)
@onready var dash_state: BaseState = get_node(dash_node)
@onready var walk_state: BaseState = get_node(walk_node)
@onready var attack_state: BaseState = get_node(attack_node)

func input(event: InputEvent) -> BaseState:
	if Input.is_action_just_pressed("atk"):
		return attack_state
	
	if Input.is_action_just_pressed("dash"):
		return dash_state

	return null

func physics_process(delta: float) -> BaseState:
	var move = get_movement_input()
	character.velocity  = move * (character.speed * Global.TILESIZE)
	character.move_and_slide()
	
	if move == Vector2.ZERO:
		return idle_state

	return null

func get_movement_input() -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	#if Input.is_action_pressed("move_left"):
	#	return Vector2.LEFT
	#elif Input.is_action_pressed("move_right"):
	#	return Vector2.RIGHT
	
	#return Vector2.ZERO
