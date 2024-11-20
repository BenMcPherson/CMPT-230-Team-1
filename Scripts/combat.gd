extends Node

const Battle_Units = preload("res://Resources/Battle_Units.tres")

# Get instance from game
@onready var battle_action_buttons = $UI/BattleActionButtons
@onready var player_animations = $Player/Player_Animations
@onready var message_state = $Message

# Music
@onready var battle_music = $BattleMusic

func _ready():
	battle_music.play()
	message_state.hide()
	start_player_turn()


func start_enemy_turn():
	battle_action_buttons.hide() #Hide combat buttons
	var enemy = Battle_Units.Enemy
	if enemy != null: #Check if enemy exists
		enemy.choose_move() #Run attack function
		await(enemy.end_turn)
	start_player_turn()


func start_player_turn():
	battle_action_buttons.show() #Show combat buttons
	var player_states = Battle_Units.PlayerState
	player_states.ap = player_states.max_ap #Reset Action points
	await(player_states.end_turn) #Wait until action point equal zero
	start_enemy_turn()

#When enemy dies
func _on_enemy_died(): #Win function
	battle_action_buttons.hide()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_player_states_died():
	battle_action_buttons.hide()
	get_tree().change_scene_to_file("res://Scenes/LoadingScreens/LoadGame.tscn")


# Easy Debug Exit
func _input(_ev):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
