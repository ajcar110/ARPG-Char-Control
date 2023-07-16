extends State

func Enter():
	character.velocity = Vector2.ZERO
	animation.play("DashRecover" + character.facing)
	await  get_tree().create_timer(.8).timeout
	Transitioned.emit(self,"Idle")

func Physics_Update(delta):
	pass


func Exit():
	character.can_dash = true
