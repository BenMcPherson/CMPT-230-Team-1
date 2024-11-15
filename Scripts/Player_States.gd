extends Node

const Battle_Units = preload("res://Resources/Battle_Units.tres")

## Player Stats

#Health
var max_hp = 25
var hp = max_hp: set = set_hp

#Action Points
var max_ap = 5
var ap = max_ap: set = set_ap

#Attack
var init_atk = 1
var atk = init_atk: set = set_atk

#Defense
var init_def = 1
var def = init_def: set = set_def

#Player animation key
var idle = "Idle"

#Set up signals
signal hp_changed(value)
signal ap_changed(value)
signal end_turn

## Set/Get functions
func set_hp(value):
	hp = clamp(value, 0, max_hp)
	emit_signal("hp_changed", hp)
	
func set_ap(value):
	ap = clamp(value, 0, max_ap)
	emit_signal("ap_changed", ap)
	if ap == 0:
		emit_signal("end_turn")

func set_atk(value):
	atk = value
	
func set_def(value):
	def = value

func _ready():
	Battle_Units.PlayerState = self
	
func _exit_tree():
	Battle_Units.PlayerState = null
