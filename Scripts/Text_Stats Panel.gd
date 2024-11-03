extends Panel

@onready var hp_label = $VBoxContainer/HP
@onready var ap_label = $VBoxContainer/AP


func _on_player_states_hp_changed(value):
	hp_label.text = "HP: "+str(value)


func _on_player_states_ap_changed(value):
	ap_label.text = "AP: "+str(value)
	
