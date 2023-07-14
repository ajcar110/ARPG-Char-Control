extends State

class_name Move

var facing

func Enter():
	facing = character.facing
	animation.play("Walk" + facing)

func Physics_Update(delta:float):
	character.handleInput() 
	if facing != character.facing:
		facing = character.facing
		animation.play("Walk" + facing)
	if character.dashing:
			Transitioned.emit(self,"Dash")
	if character.velocity == Vector2.ZERO:
		Transitioned.emit(self,"Idle")
	super(delta)


