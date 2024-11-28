extends "res://Scripts/Action_Button.gd"


func _on_pressed():
	var player_states = Battle_Units.PlayerState
	$Click.play()
	if player_states != null and Global.turn:
		Global.turn = false
		player_states.temp_def += 3
		player_states.ap -= player_states.ap
		Global.turn = true
