extends StateMachine

@export var attack_node: NodePath
@export var hurt_node: NodePath
@export var idle_node: NodePath

@onready var attack_state: BaseState = get_node(attack_node)
@onready var hurt_state: BaseState = get_node(hurt_node)
@onready var idle_state: BaseState = get_node(idle_node)
