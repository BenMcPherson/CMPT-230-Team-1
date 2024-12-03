extends Node

func sequence():
	# warning
	await get_tree().create_timer(3).timeout
	$OpeningUI/WARNING.show()
	await get_tree().create_timer(7).timeout
	$OpeningUI/WARNING.hide()
	
	# Powered By Godot Game Engine
	await get_tree().create_timer(2).timeout
	$OpeningUI/GodotCredit/PoweredBy.show()
	await get_tree().create_timer(1).timeout
	$OpeningUI/GodotCredit/GodotGameEngine.show()
	$OpeningUI/GodotCredit/WhiteGodot.show()
	await get_tree().create_timer(3).timeout
	$OpeningUI/GodotCredit.hide()
	
	await get_tree().create_timer(2).timeout
	$OpeningUI/Minifigure.show()
	await get_tree().create_timer(1).timeout
	$OpeningUI/Team1.show()
	await get_tree().create_timer(3).timeout
	$OpeningUI/Minifigure.hide()
	$OpeningUI/Team1.hide()
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")	

# Called when the node enters the scene tree for the first time.
func _ready():
	sequence()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
