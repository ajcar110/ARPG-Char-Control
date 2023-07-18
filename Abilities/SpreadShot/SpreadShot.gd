extends Ability

@export var spread = 3

@onready var abilities = $Abilities

var facing

func _ready():
	facing = source.facing
	get_spread()

func get_spread():
	var facing_angle = source.direction_map[facing].angle()
	var spread_angle = snappedf(facing_angle, PI/spread) / (PI/spread)
	spread_angle = wrapi(int(spread_angle),0,spread*2)
	print(spread_angle)
	for i in spread:
		Utils.load_ability(source,"Shoot")
	for i in get_parent().get_children():
		if i != self:
			i.reparent(abilities)
	


func Execute():
	for i in abilities.get_children():
		facing = source.facing
		i.Execute()
