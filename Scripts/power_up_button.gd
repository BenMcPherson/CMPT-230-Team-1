extends "res://Scripts/Action_Button.gd"


func _on_pressed():
	var main = get_tree().current_scene
	var player_states = main.find_child("Player_States")
	
	if player_states != null:
		if player_states.atk == player_states.init_atk:
			player_states.atk += 4
			player_states.def += 1
