extends Node

@onready var enemy = $Enemy
@onready var attack_button = $UI/GridContainer/Attack_Button
@onready var player_animations = $Player/Player_Animations
@onready var player_states = $Player_States

func _on_attack_button_pressed():
	if enemy != null:
		player_animations.play("Punch")
		await (player_animations.animation_finished)
		enemy.hp -= player_states.get_attack()
		player_animations.play("Idle")


func _on_test_enemy_died():
	attack_button.hide()
	enemy = null

# Easy Debug Exit
func _input(ev):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
