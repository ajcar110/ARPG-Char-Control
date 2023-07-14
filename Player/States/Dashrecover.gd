extends State

func Enter():
	character.velocity = Vector2.ZERO
	animation.play("DashRecover" + character.facing)

func Physics_Update(delta):
	pass

func _on_dash_timer_timeout():
	character.can_dash = true
	Transitioned.emit(self, "Idle")
