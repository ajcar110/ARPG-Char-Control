extends BaseState

class_name IdleState

@export var walk_node: NodePath
@export var dash_node: NodePath
@export var attack_node: NodePath


@onready var walk_state: BaseState = get_node(walk_node)
@onready var dash_state: BaseState = get_node(dash_node)
@onready var attack_state: BaseState = get_node(attack_node)

func enter() -> void:
	super.enter()
	character.velocity = Vector2.ZERO
	print("Idle Entered")

func input(event: InputEvent) -> BaseState:
	if (Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right")
	or Input.is_action_just_pressed("move_down") or Input.is_action_just_pressed("move_up")):
		return walk_state
	elif Input.is_action_just_pressed("atk"):
		return attack_state
		print("Attacking")
	elif Input.is_action_just_pressed("dash"):
		return dash_state
		print("Dashing")
	return null
