extends Node

# Player Stats
var max_hp = 25
var hp = max_hp: set = set_hp

var _attack = 4
var _defence = 1

#var _exp = 0
#var _max_exp = 10

var max_ap = 10
var ap = max_ap: set = set_ap

signal hp_changed(value)
signal ap_changed(value)
signal end_turn

func set_hp(value):
	hp = min(value, max_hp)
	emit_signal("hp_changed", hp)
	
func set_ap(value):
	ap = min(value, max_ap)
	emit_signal("ap_changed", ap)
	
func get_attack():
	# Get The Player Attack
	return _attack

func set_attack(value):
	# Set the Value of Player Attack to New Number
	_attack = value
		
func get_defence():
	# Get the Player Defence
	return _defence

func set_defence(value):
	# Set the Value of Player Defence to New Number
	_defence = value	
	

