extends Node2D




func _on_area_2d_body_entered(body):
	if body is Player:
		print('Change order')
		z_index = 1


func _on_area_2d_body_exited(body):
	if body is Player:
		z_index = 0
