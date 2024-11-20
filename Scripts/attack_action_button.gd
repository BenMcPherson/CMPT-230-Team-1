extends "res://Scripts/Action_Button.gd"

func _on_pressed():
	var main = get_tree().current_scene
	var enemy = Battle_Units.Enemy
	var player_states = Battle_Units.PlayerState
	var player_animations = main.find_child("Player_Animations")
	
	$CombatSFX/ClickedSFX.play()
	if enemy != null and player_states != null:
		player_animations.play(player_states.attack) #Play punch animation
		await (player_animations.animation_finished)
		$CombatSFX/PunchSFX.play()
		enemy.take_damage(player_states.atk)
		player_states.ap -= 1
		player_animations.play(player_states.idle) #Resume Idle

