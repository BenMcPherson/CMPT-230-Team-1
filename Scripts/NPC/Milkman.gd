extends Node2D


signal cup_of_milk
signal no_milk

func _on_area_2d_body_entered(body):
	if body is Player:
		emit_signal("cup_of_milk")


func _on_area_2d_body_exited(_body):
	emit_signal("no_milk")
