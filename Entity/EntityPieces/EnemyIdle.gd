extends BaseState

class_name EnemyIdleState

func enter(params={}) -> void:
	super.enter()
	character.velocity = Vector2.ZERO
