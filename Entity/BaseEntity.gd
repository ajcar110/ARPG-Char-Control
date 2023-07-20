extends CharacterBody2D

class_name Entity
@export var speed = 4

signal FacingUpdated

var attack
var facing: String = "Down"
var direction_map = {"Left":Vector2.LEFT,
					"Right":Vector2.RIGHT,
					"Up":Vector2.UP,
					"Down":Vector2.DOWN}



func facing_direction(targetdir):
	if targetdir.x < 0: facing  = "Left"
	elif targetdir.x > 0: facing = "Right"
	elif targetdir.y >0: facing = "Down"
	elif targetdir.y < 0: facing = "Up"


func _on_detection_zone_body_entered(body):
	var targetdir = self.position.direction_to(body.position)
	facing_direction(targetdir)
	print(facing)
	FacingUpdated.emit()
	
