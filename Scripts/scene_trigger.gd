class_name SceneTrigger extends Area2D

@export var connected_scene: String
var player

func _on_body_entered(body):
	if connected_scene == 'combat':
		Global.tutorial = false
	elif connected_scene == 'beach':
		Global.current_scene = 'beach'
	else:
		Global.current_scene = 'game'
		
	if body is Player:
		Global.found_companion = Dialogic.VAR.Milk_Choice
		Global.found_power_up = Dialogic.VAR.Shark_Choice
		print(Global.found_companion, Global.found_power_up)
		scene_manager.change_scene(body.get_parent(), connected_scene)
