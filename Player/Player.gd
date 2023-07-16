extends CharacterBody2D
@export var speed = 100
@export var dash_speed = 200
@onready var hurtbox = $HurtBox
@onready var abilities = $Abilities


var dash_direction: Vector2
var facing: String = "Down"
var dashing: bool = false
var attacking : bool = false
var can_dash: bool = true
var direction: Vector2 = Vector2.DOWN
var ability_1
var direction_map = {"Left":Vector2.LEFT,
					"Right":Vector2.RIGHT,
					"Up":Vector2.UP,
					"Down":Vector2.DOWN}

func _ready():
	ability_1 = Utils.load_ability(self,"Shoot")

func handleInput():
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if !dashing:
		velocity = direction * speed
	facing_direction()
	if Input.is_action_just_pressed("dash") && can_dash:
		dashing = true
		if direction == Vector2.ZERO:
			direction = Vector2.DOWN
		dash_direction = direction.normalized()
		velocity = dash_direction * dash_speed
	if Input.is_action_just_pressed("atk"):
		attacking=true
	if Input.is_action_just_pressed("ability1"):
		ability_1.Execute()

func facing_direction():
	if velocity.x < 0: facing  = "Left"
	elif velocity.x > 0: facing = "Right"
	elif velocity.y >0: facing = "Down"
	elif velocity.y < 0: facing = "Up"
