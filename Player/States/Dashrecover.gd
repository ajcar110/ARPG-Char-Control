extends State




func Enter():
	facing = character.facing
	character.velocity = Vector2.ZERO
	animation.play("DashRecover" + facing)






func _on_dash_timer_timeout():
	character.can_dash = true
	Transitioned.emit(self, "Idle")
