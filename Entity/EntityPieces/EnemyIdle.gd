extends BaseState

class_name EnemyIdleState

func enter() -> void:
	super.enter()
	character.velocity = Vector2.ZERO
