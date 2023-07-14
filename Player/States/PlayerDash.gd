extends State

@export var dashtimer: Timer

func Enter():
	character.hurtbox.monitorable = false
	animation.play("Dash" + character.facing)
	character.can_dash = false
	dashtimer.start()

func _on_animated_sprite_2d_animation_finished():
	if animation.animation == "Dash" + character.facing:
		character.dashing = false
		Transitioned.emit(self,"Dashrecover")
