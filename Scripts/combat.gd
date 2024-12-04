extends Node

const Battle_Units = preload("res://Resources/Battle_Units.tres")

## Get instance from game
#Buttons
@onready var battle_action_buttons = $UI/BattleActionButtons
@onready var item_button = $UI/BattleActionButtons/Item_Button
@onready var companion_button = $UI/BattleActionButtons/Companion_Button

#Player specific
@onready var player_animations = $Player/Player_Animations

#UI
@onready var end_turn_message = $"UI/End Turn Message"

# Music
@onready var battle_music = $Player_States/BattleMusic


func _ready():
	visible_buttons()
	battle_music.play()
	start_player_turn()

func visible_buttons():
	if Global.found_companion == false:
		companion_button.hide()
		
	if Global.found_power_up == false:
		item_button.hide()
		

func start_enemy_turn():
	battle_action_buttons.hide() #Hide combat buttons
	var enemy = Battle_Units.Enemy
	enemy.def = enemy.init_def
	if enemy != null and not(Global.dead): #Check if enemy exists
		enemy.choose_move() #Run attack function
		await(enemy.end_turn)
	if not(Battle_Units.PlayerState.is_dead()):
		start_player_turn()


func start_player_turn():
	battle_action_buttons.show() #Show combat buttons
	var player_states = Battle_Units.PlayerState
	player_states.temp_def = player_states.init_temp_def
	if not(player_states.is_dead()):
		player_states.ap = player_states.max_ap #Reset Action points
		await(player_states.end_turn) #Wait until action point equal zero
		start_enemy_turn()

#When enemy dies
func _on_enemy_died(): #Win function
	battle_action_buttons.hide()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/end_cutscene.tscn")

func _on_player_states_died():
	battle_action_buttons.hide()
	get_tree().change_scene_to_file("res://Scenes/game.tscn")


# Easy Debug Exit
func _input(_ev):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()


func _on_enemy_def_bulk():
	end_turn_message.show()
	await(get_tree().create_timer(0.4).timeout)
	end_turn_message.hide()
	pass # Replace with function body.
