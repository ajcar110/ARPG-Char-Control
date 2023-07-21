extends StateMachine

@export var attack_node: NodePath

@onready var attack_state: BaseState = get_node(attack_node)
