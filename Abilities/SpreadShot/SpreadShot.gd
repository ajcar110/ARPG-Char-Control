extends Ability

@export var spread = 4

@onready var abilities = $Abilities

var facing

func _ready():
	get_spread()

func get_spread():
	for i in spread:
		Utils.load_ability(source,"Shoot")


func Execute():
	facing = source.facing
	for i in abilities.get_children():
		i.Execute()
