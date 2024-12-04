extends Node2D

@onready var video_stream_player = $VideoStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	video_stream_player.play()
	


func _on_video_stream_player_finished():
	print('Cutscene done')
	get_tree().change_scene_to_file("res://Scenes/end_game.tscn")
