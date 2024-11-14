extends Node

# SFX
@onready var click = $CreditsSFX/ClickSFX

func _on_back_button_pressed():
	click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/options.tscn")
