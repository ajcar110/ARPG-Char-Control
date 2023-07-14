extends State

@export var dashtimer: Timer


func Enter():
	facing = character.facing
	character.hurtbox.monitorable = false
	animation.play("Dash" + facing)
	character.can_dash = false
	dashtimer.start()








func _on_animated_sprite_2d_animation_finished():
	print("ding")
	if animation.animation == "Dash" + facing:
		character.dashing = false
		Transitioned.emit(self,"Dashrecover")
