extends "res://Scripts/Action_Button.gd"


func _on_pressed():
	var main = get_tree().current_scene
	var player_states = main.find_child("Player_States")
	
	if player_states != null:
		player_states.ap -= player_states.ap
