extends Node

class_name Damageable

signal on_hit(damage_taken:int, knockback_direction : Vector2)



@export var character: Entity

@onready var health: float = character.max_health

func hit(damage:int, knockback_direction: Vector2):
	health -= damage
	character.states.hurt_state.interupt_state.emit(
		character.states.hurt_state,
		{"damage": damage, "knockback_direction": knockback_direction}
	)
	#emit_signal("on_hit", damage, knockback_direction)
