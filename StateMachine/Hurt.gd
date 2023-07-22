extends BaseState

class_name Hurt

var damage: int
var knockback_direction: Vector2

func enter(params={}) -> void:
	damage = params["damage"]
	knockback_direction = params["knockback_direction"]
	character.velocity = knockback_direction * 500

func physics_process(delta: float) -> BaseState:
	character.velocity = character.velocity.lerp(Vector2.ZERO, .025)
	character.move_and_slide()
	if abs(character.velocity.x) < 70 && abs(character.velocity.y) < 70:
		return character.states.idle_state
		
	return null
