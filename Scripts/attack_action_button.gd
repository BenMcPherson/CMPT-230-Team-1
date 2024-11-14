extends "res://Scripts/Action_Button.gd"

func _on_pressed():
	var main = get_tree().current_scene
	var enemy = main.find_child("Enemy")
	var player_states = main.find_child("Player_States")
	var player_animations = main.find_child("Player_Animations")
	
	$CombatSFX/ClickedSFX.play()
	if enemy != null and player_states != null:
		player_animations.play("Punch") #Play punch animation
		await (player_animations.animation_finished)
		$CombatSFX/PunchSFX.play()
		enemy.take_damage(player_states.atk)
		player_states.ap -= 1
		player_animations.play("Idle") #Resume Idle

