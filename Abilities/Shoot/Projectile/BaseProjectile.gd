extends CharacterBody2D

class_name Projectile

#speed is a factor of 32 pixels covered in 1 sec ---- ex: speed 1 = 32 , speed 3 = 96
@export var speed = 1
@export var damage = 5
#range calculated as physics frames
@export var distance = 10

var spawnpoint
var source
var facing

func _ready():
	spawnpoint = position

func  _physics_process(delta):
	velocity = (speed*32) * source.direction_map[facing]
	move_and_slide()
	
	if self.position.distance_to(spawnpoint) >= distance*32:
		queue_free()
	
