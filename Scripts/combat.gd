extends Node

@onready var enemy = $Enemy
@onready var attack_button = $UI/GridContainer/Attack_Button
@onready var player_animations = $Player/Player_Animations
@onready var player_states = $Player_States
@onready var message_state = $Message

func _ready():
	message_state.hide()
	
func _on_attack_button_pressed():
	$CombatSFX/ClickedSFX.play()
	if enemy != null:
		if player_states.ap != 0:
			player_states.ap -= 1
			player_animations.play("Punch")
			await (player_animations.animation_finished)
			$CombatSFX/PunchSFX.play()
			enemy.hp -= 1 #player_states.get_attack()
			player_animations.play("Idle")
		else:
			message_state.text = "No Action Points Available..."
			message_state.show()
			await get_tree().create_timer(1).timeout
			message_state.hide()
	
func _on_test_enemy_died():
	attack_button.hide()
	enemy = null

# Easy Debug Exit
func _input(_ev):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
