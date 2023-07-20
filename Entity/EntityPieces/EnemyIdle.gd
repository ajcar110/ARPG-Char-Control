extends State




func _ready():
	character.FacingUpdated.connect(on_facing_updated)


func Enter():
	animation.play("Idle" + character.facing)
	


func on_facing_updated():
	animation.play("Idle" + character.facing)
