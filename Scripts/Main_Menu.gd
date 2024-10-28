extends Node

# Menu Buttons for Access
@onready var play_button = $Menu_UI/Play_Button
@onready var combat_button = $Menu_UI/Combat_Button
@onready var settings_button = $Menu_UI/Settings_Button
@onready var exit_button = $Menu_UI/Exit_Button


func _on_play_button_pressed():
	# Open player.tscn
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
	

func _on_combat_button_pressed():
	# Open combat.tscn
	get_tree().change_scene_to_file("res://Scenes/combat.tscn")
	


func _on_exit_button_pressed():
	# Exit and close game
	get_tree().quit()
