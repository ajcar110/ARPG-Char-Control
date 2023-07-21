extends Entity

class_name Player

var test 

func _ready():
	test = Utils.load_ability("TestAbility",states.attack_state,"Atk")
	super._ready()
