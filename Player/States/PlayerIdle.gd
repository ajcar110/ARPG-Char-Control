extends State

class_name Idle





func Enter():
	facing = character.facing
	animation.play("Idle" + facing)


func Physics_Update(delta):
	if character.velocity != Vector2.ZERO:
		character.facing_direction()
		if character.dashing:
			Transitioned.emit(self,"Dash")
		Transitioned.emit(self,"Move")
		
		
