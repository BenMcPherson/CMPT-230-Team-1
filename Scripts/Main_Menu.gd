extends Node

# Menu Buttons for Access
@onready var play_button = $Menu_UI/Play_Button
@onready var combat_button = $Menu_UI/Combat_Button
@onready var settings_button = $Menu_UI/Settings_Button
@onready var exit_button = $Menu_UI/Exit_Button

# Sound Effects
@onready var click = $MenuSFX/ClickedSFX

func _on_play_button_pressed():
	# Open player.tscn
	click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/LoadingScreens/LoadGame.tscn")
	
func _on_combat_button_pressed():
	# Open combat.tscn
	click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/LoadingScreens/LoadCombat.tscn")

func _on_exit_button_pressed():
	# Exit and close game
	click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().quit()

func _on_settings_button_pressed():
	# Open the settings for the game
	click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/options.tscn")
