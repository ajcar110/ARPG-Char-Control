extends Node


func load_ability(source:CharacterBody2D,name:String):
	var scene = load("res://Abilities/" +name + "/" + name + ".tscn")
	var sceneNode = scene.instantiate()
	source.abilities.add_child(sceneNode)
	sceneNode.source = source
	return sceneNode



func spawn_projectile(source:CharacterBody2D, name : String, position : Vector2):
	var world = get_tree().current_scene
	var scene = load("res://Abilities/Shoot/Projectile/" +name + "/" + name + ".tscn")
	var instance = scene.instantiate()
	world.add_child.call_deferred(instance)
	instance.source = source
	instance.global_position = position
	instance.facing = source.facing
	return instance
