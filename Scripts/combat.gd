extends Node

# Get instance from game
@onready var enemy = $Enemy
@onready var battle_action_buttons = $UI/BattleActionButtons
@onready var player_animations = $Player/Player_Animations
@onready var player_states = $Player_States
@onready var message_state = $Message

func _ready():
	message_state.hide()
	start_player_turn()


func start_enemy_turn():
	battle_action_buttons.hide() #Hide combat buttons
	if enemy != null: #Check if enemy exists
		enemy.attack(player_states) #Run attack function
		await(enemy.end_turn)
	start_player_turn()


func start_player_turn():
	battle_action_buttons.show() #Show combat buttons
	player_states.ap = player_states.max_ap #Reset Action points
	await(player_states.end_turn) #Wait until action point equal zero
	start_enemy_turn()

#When enemy dies
func _on_enemy_died():
	battle_action_buttons.hide()
	enemy = null

# Easy Debug Exit
func _input(_ev):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()

