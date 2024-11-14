extends Node

@onready var options_UI = $OptionsUI
@onready var exit_button = $OptionsUI/Exit_Button

var is_UI_open = false

func toggle_UI():
	# If the UI is already open, close it
	if is_UI_open:
		options_UI.hide()
		is_UI_open = false
	else:
	# If the UI is already closed, open it
		options_UI.show()
		is_UI_open = true

# Called when the node enters the scene tree for the first time.
func _ready():
	options_UI.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(_ev):
	if Input.is_key_pressed(KEY_ESCAPE):
		toggle_UI()


func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/LoadingScreens/LoadMainMenu.tscn")
