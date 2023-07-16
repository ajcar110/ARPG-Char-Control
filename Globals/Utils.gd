extends Node


func load_ability(owner:CharacterBody2D,name:String):
	var scene = load("res://Abilities/" +name + "/" + name + ".tscn")
	var sceneNode = scene.instantiate()
	owner.abilities.add_child(sceneNode)
	return sceneNode
