extends Node

var max_hp = 25
var hp = max_hp: set = set_hp

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
