extends CharacterBody2D

class_name Entity

@export var speed = 4
@export var dash_speed = 8

@onready var animations = $AnimationPlayer
@onready var states = $StateMachine



signal FacingUpdated

var attack
var facing: String = "Down"
var direction_map = {"Left":Vector2.LEFT,
					"Right":Vector2.RIGHT,
					"Up":Vector2.UP,
					"Down":Vector2.DOWN}

func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	states.init(self)

func _unhandled_input(event: InputEvent) -> void:
	states.input(event)

func _physics_process(delta: float) -> void:
	states.physics_process(delta)

func _process(delta: float) -> void:
	states.process(delta)


func facing_direction(targetdir):
	if targetdir.x < 0: facing  = "Left"
	elif targetdir.x > 0: facing = "Right"
	elif targetdir.y >0: facing = "Down"
	elif targetdir.y < 0: facing = "Up"

