extends Control

@export_multiline var description = ""

func _on_mouse_entered():
	var main = get_tree().current_scene
	var textbox = main.find_child("TextBox")
	if textbox != null:
		textbox.text = description


func _on_mouse_exited():
	var main = get_tree().current_scene
	var textbox = main.find_child("TextBox")
	if textbox != null:
		textbox.text = ""
