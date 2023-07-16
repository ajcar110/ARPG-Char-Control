extends State


func Enter():
	character.hurtbox.monitorable = false
	animation.play("Dash" + character.facing)
	character.can_dash = false
	await get_tree().create_timer(1).timeout
	Transitioned.emit(self,"Dashrecover")




func Exit():
		character.dashing = false
