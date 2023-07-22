extends BaseState

class_name IdleState



func enter(params={}) -> void:
	super.enter()
	character.velocity = Vector2.ZERO

func input(event: InputEvent) -> BaseState:
	if (Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right")
	or Input.is_action_pressed("move_down") or Input.is_action_pressed("move_up")):
		return character.states.walk_state
		
	elif Input.is_action_just_pressed("atk"):
		return character.states.attack_state
		
	elif Input.is_action_just_pressed("ability1"):
		return character.states.ability_1_state
		
	elif Input.is_action_just_pressed("ability2"):
		return character.states.ability_2_state
	elif Input.is_action_just_pressed("dash"):
		return character.states.dash_state
		
	return null
