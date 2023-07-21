extends BaseState

class_name AttackState

var done = false


func enter():
	super.enter()
	character.animations.connect("animation_finished",_on_attack_finished)
	character.hitbox.monitoring = true
	

func physics_process(delta: float) -> BaseState:
	if done:
		return character.states.idle_state
	return null

func _on_attack_finished(anim_name):
	done = true

func exit() -> void:
	done = false
	character.hitbox.monitoring = false
