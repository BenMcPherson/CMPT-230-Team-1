extends Node

@onready var enemy = $Enemy
@onready var attack_button = $UI/GridContainer/Attack_Button
@onready var player_animations = $Player/Player_Animations

func _on_attack_button_pressed():
	if enemy != null:
		player_animations.play("Punch")
		await (player_animations.animation_finished)
		enemy.hp -= 4
		player_animations.play("Idle")


func _on_test_enemy_died():
	attack_button.hide()
	enemy = null
