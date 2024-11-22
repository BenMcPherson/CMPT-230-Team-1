extends "res://Scripts/Action_Button.gd"


func _on_pressed():
	var player_states = Battle_Units.PlayerState
	if player_states != null and Global.turn:
		Global.turn = false
		player_states.hp += 5
		player_states.ap -= 1
		Global.turn = true
