class_name SceneTrigger extends Area2D

@export var connected_scene: String
var player

func _on_body_entered(body):
	if body is Player:
		Global.found_companion = Dialogic.VAR.Milk_Choice
		Global.found_power_up = Dialogic.VAR.Shark_Choice
		scene_manager.change_scene(body.get_parent(), connected_scene)
