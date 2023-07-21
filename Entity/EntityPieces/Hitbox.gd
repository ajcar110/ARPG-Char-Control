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
			var direction_to_damageable = area.position.direction_to(character.position)
			
			child.hit(damage, direction_to_damageable)

