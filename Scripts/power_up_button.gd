extends "res://Scripts/Action_Button.gd"


func _on_pressed():
	var main = get_tree().current_scene
	var player_states = Battle_Units.PlayerState
	var player_animations = main.find_child("Player_Animations")
	
	if player_states != null:
		if player_states.atk == player_states.init_atk:
			player_states.atk += 4
			player_states.def += 1
			#Player become shark
			player_states.idle = "SharkIdle"
			player_states.attack = 'Punch'
			player_states.hurt = 'Hurt'
			player_states.death = 'Death'
			player_states.transform = 'Shark'
			player_animations.play(player_states.idle) #Resume Idle
