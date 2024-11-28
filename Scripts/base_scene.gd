class_name BaseScene extends Node

@onready var player: Player = $Player
@onready var entrance_markers: Node2D = $EntranceMarkers

func _ready():
	print("yeah")
	print(Global.current_scene)
	Global.back_to = "beach"
	#Global.back_to = get_tree().current_scene
	if scene_manager.player:
		if player:
			player.queue_free()
			
		player = scene_manager.player
		add_child(player)
	Global.current_scene = 'beach'
	position_player()


func position_player() -> void:
	var last_scene = scene_manager.last_scene_name
	print(last_scene)
	if last_scene.is_empty():
		last_scene = "any"
		print("hayeah")
	elif last_scene.contains("neighbour_house"):
		Global.tutorial = false
	for entrance in entrance_markers.get_children():
		print(last_scene)
		if entrance is Marker2D and entrance.name == "any" or entrance.name == last_scene:
			print(last_scene)
			player.global_position = entrance.global_position
