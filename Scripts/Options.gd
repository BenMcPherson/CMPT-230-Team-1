extends Node

# SFX Variables
@onready var click = $OptionsSFX/ClickSFX

func _on_back_button_pressed():
	# Go Back to the main menu
	click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_credits_button_pressed():
	click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")
