extends Entity

class_name Player


func _ready():
	Utils.load_ability("TestAbility",states.ability_1_state,"Atk")
	super._ready()
