extends Node

@onready var loading_progress = $Loading_Screen/Loading_Progress
var percent = 0.0
signal done

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	percent += 0.5
	loading_progress.set_value(percent)
	if percent >= 100:
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
