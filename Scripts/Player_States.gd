extends Node

@warning_ignore("shadowed_global_identifier")
const Battle_Units = preload("res://Resources/Battle_Units.tres")
@onready var player_animations = $"../Player/Player_Animations"

## Player Stats

#Health
var max_hp = 20
var hp = max_hp: set = set_hp

#Action Points
var max_ap = 1
var ap = max_ap: set = set_ap

#Attack
var init_atk = 2
var atk = init_atk: set = set_atk

#Defense
var init_def = 1
var def = init_def: set = set_def

var init_temp_def = 1
var temp_def = init_temp_def: set  = set_temp_def

#Player animation key
var idle = "Idle"
var attack = 'Punch'
var hurt = 'Hurt'
var death = 'Death'
var transform = 'Null'

#Set up signals
signal hp_changed(value)
signal ap_changed(value)
signal end_turn
signal died

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

func set_temp_def(value):
	temp_def = value

func _ready():
	Battle_Units.PlayerState = self
	
func _exit_tree():
	Battle_Units.PlayerState = null

func take_damage(amount):
	#Reduce incoming damage
	if temp_def > def:
		self.hp -= amount/temp_def
		self.temp_def = init_temp_def
	else:
		self.hp -= amount/def
	#Check if player has died
	if is_dead(): #Player lose/death
		player_animations.play(death)
		await (player_animations.animation_finished)
		emit_signal("died") #emit signal to combat
		queue_free()
	else: #Player Hurt
		player_animations.play(hurt)
		await (player_animations.animation_finished)
		player_animations.play(idle)
		
func is_dead():
	return hp <= 0
