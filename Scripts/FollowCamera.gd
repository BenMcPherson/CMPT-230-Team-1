extends Camera2D

@export var follow_node: Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	global_position = follow_node.global_position
