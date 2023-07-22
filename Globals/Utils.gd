extends Node


func load_ability(name:String,state:Node,state_animation_name: String):
	var script = load("res://Abilities/" +name + "/" + name + ".gd")
	state.set_script(script)
	state.animation_name = state_animation_name



func spawn_projectile(source:CharacterBody2D, name : String, position : Vector2):
	var world = get_tree().current_scene
	var scene = load("res://Abilities/Shoot/Projectile/" +name + "/" + name + ".tscn")
	var instance = scene.instantiate()
	world.add_child.call_deferred(instance)
	instance.source = source
	instance.global_position = position
	instance.facing = source.facing
	return instance
