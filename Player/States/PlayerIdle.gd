extends State

class_name Idle

func Enter():
	animation.play("Idle" + character.facing)

func Physics_Update(delta):
	if character.attacking:
		Transitioned.emit(self,"Attack")
	if character.velocity != Vector2.ZERO:
		character.facing_direction()
		if character.dashing:
			Transitioned.emit(self,"Dash")
		Transitioned.emit(self,"Move")
	super(delta)
