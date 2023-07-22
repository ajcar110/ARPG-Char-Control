extends Area2D

@export var damage:int = 1
@export var character: Entity

func _ready():
	self.monitoring = false

func _on_area_entered(area):
	for child in area.get_children():
		if child is Damageable:
			print("Hit:")
			print(area.get_parent().name)
			var direction_to_damageable = character.position.direction_to(area.position)
			
			child.hit(damage, direction_to_damageable)

