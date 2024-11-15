extends "res://Scripts/Action_Button.gd"


func _on_pressed():
	var player_states = Battle_Units.PlayerState
	if player_states != null:
		player_states.hp += 5
		player_states.ap -= 1
