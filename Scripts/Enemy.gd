extends Node2D

var hp = 25: set = set_hp

@onready var hp_label = $HP_Label

signal died

func set_hp(new_hp):
	hp = new_hp
	hp_label.text = str(hp) + 'HP'
	
	if hp <= 0:
		#Remove node
		emit_signal("died")
		queue_free()
	else:
		print('Enemey Attack')
