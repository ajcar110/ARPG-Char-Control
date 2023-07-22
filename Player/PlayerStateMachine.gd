extends StateMachine

@export var dash_node: NodePath
@export var idle_node: NodePath
@export var walk_node: NodePath
@export var attack_node: NodePath
@export var fall_node: NodePath
@export var hurt_node: NodePath
@export var ability_1_node: NodePath
@export var ability_2_node: NodePath
@export var ability_3_node: NodePath

@onready var idle_state: BaseState = get_node(idle_node)
@onready var dash_state: BaseState = get_node(dash_node)
@onready var walk_state: BaseState = get_node(walk_node)
@onready var attack_state: BaseState = get_node(attack_node)
@onready var fall_state:BaseState = get_node(fall_node)
@onready var hurt_state:BaseState = get_node(hurt_node)
@onready var ability_1_state:BaseState = get_node(ability_1_node)
@onready var ability_2_state:BaseState = get_node(ability_2_node)
@onready var ability_3_state:BaseState = get_node(ability_3_node)

