extends Node

@onready var hp_label = $Test_Enemy/HP_Label

func _on_attack_button_pressed():
	hp_label.text = '15HP'
