extends "res://Scripts/Action_Button.gd"


func _on_pressed():
	var main = get_tree().current_scene
	var attack = main.find_child("Attack_Action_Button")
	var item = main.find_child("Item_Button")
	var companion = main.find_child("Companion_Button")
	var end_turn = main.find_child("End_Turn_Button")
	var power_up = main.find_child("Power_Up_Button")
	var return_button = main.find_child("Return_Button")
	
	$Click.play()
	if attack != null and item != null and companion != null and end_turn != null and power_up != null and return_button != null:
		attack.show()
		item.show()
		companion.show()
		end_turn.show()
		power_up.hide()
		return_button.hide()
