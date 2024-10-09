extends Node

@onready var enemy = $Test_Enemy
@onready var attack_button = $Comabt_UI/Attack_Button

func _on_attack_button_pressed():
	if enemy != null:
		enemy.hp -= 4


func _on_test_enemy_died():
	attack_button.hide()
	enemy = null
