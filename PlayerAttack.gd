extends State
@onready var atk_timer = $"../../ATKTimer"

func Enter():
	atk_timer.start()
	animation.play("Atk" + character.facing)


func _on_timer_timeout():
	character.attacking =false
	Transitioned.emit(self, "Idle")
