extends Ability

@export var number_of_projectiles: int = 1

func Execute():
	for i in number_of_projectiles:
		Utils.spawn_projectile(source,"small",self.global_position)