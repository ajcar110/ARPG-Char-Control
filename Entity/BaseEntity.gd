extends CharacterBody2D

class_name Entity


@export_category("STATS")
@export var max_health = 10
@export var speed = 4
@export var dash_speed = 8

@onready var animations = $AnimationPlayer
@onready var states = $StateMachine
@onready var hitbox = $HitBox
@onready var damageable = $HurtBox/Damagable

var facing: String = "Down"
var facing_index: int
var facing_arr = ["Right", "Right", "Down", "Left", "Left", "Left", "Up", "Right"]

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


func set_facing(direction):
	if direction == Vector2.ZERO:
		return null
	var facing_angle = direction.angle()
	var facing_direction = snappedf(facing_angle, PI/4) / (PI/4)
	facing_index = wrapi(int(facing_direction),0,8)
	facing = facing_arr[facing_index]

