extends Node2D


func _on_area_2d_body_entered(body):
	if body is Player:
		print('In contact with player')
		Global.interact_with_npc = true
		Global.npc = "Shark_Dialogue"


func _on_area_2d_body_exited(_body):
	Global.interact_with_npc = false
