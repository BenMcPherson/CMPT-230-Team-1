extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	var just_pressed = event.is_pressed() and not event.is_echo()
	if Input.is_key_pressed(KEY_ESCAPE) and just_pressed and !Global.pause and !Dialogic.VAR.InConvo:
		show()
		Dialogic.VAR.Movement = false
		Global.pause = true
		
	elif Input.is_key_pressed(KEY_ESCAPE) and just_pressed and Global.pause:
		pause()

func pause():
	hide()
	Dialogic.VAR.Movement = true
	Global.pause = false

func _on_resume_button_pressed():
	pause()


func _on_setting_button_pressed():
	Global.changing = true
	Dialogic.VAR.Movement = true
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/options.tscn")


func _on_quit_pressed():
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
