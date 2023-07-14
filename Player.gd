extends CharacterBody2D

@export var speed = 100
@export var dash_speed = 200
@onready var hurtbox = $HurtBox


var dash_direction: Vector2
var facing: String = "Down"
var dashing: bool = false
var can_dash: bool = true
var direction: Vector2 = Vector2.DOWN




func _physics_process(delta):
	handleInput()
	move_and_slide()


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

func facing_direction():
	if velocity.y < 0: facing = "Up"
	elif velocity.y >0: facing = "Down"
	elif velocity.x < 0: facing  = "Left"
	elif velocity.x > 0: facing = "Right"
