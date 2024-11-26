extends Node2D


signal cup_of_milk
signal no_milk

func _on_area_2d_body_entered(body):
	if body is Player:
		print('In contact with player')
		Global.interact_with_npc = true


func _on_area_2d_body_exited(_body):
	Global.interact_with_npc = false
