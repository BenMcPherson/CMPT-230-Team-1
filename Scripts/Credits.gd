extends Node

# SFX
@onready var click = $CreditsSFX/ClickSFX
@onready var credits_music = $CreditsMusic

func _ready():
	credits_music.play()
	
func _on_back_button_pressed():
	click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/options.tscn")
