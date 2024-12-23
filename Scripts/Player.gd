class_name Player extends CharacterBody2D


@onready var interaction_ui = $"Interaction UI"
@onready var walking = $Walking

#Movement Variables
var speed = 5000
var input = Vector2.ZERO
#var can_interact = false

var is_walking = false


#The player main function
func _physics_process(delta):
	change_speed()
	if Dialogic.VAR.Movement:
		player_movement(delta)
	else:
		var animated_sprite_2d = $AnimatedSprite2D
		animated_sprite_2d.play("Idle")
	
	if Global.interact_with_npc:
		$Timer.stop()
		$Walking.stop()
		interaction_ui.show()
		if Input.is_key_pressed(KEY_E):
			Dialogic.start(Global.npc)
	else:
		interaction_ui.hide()

func get_input():
	#Get a 1 or -1 for the x and y direction
	input.x = Input.get_action_strength("Move_Right") - Input.get_action_strength("Move_Left")
	input.y = Input.get_action_strength("Move_Down") - Input.get_action_strength("Move_Up")
	
	#Update the player animation
	player_animation(input.x, input.y)
	
	#Returns the vector normalized
	return input.normalized()
	
func player_movement(delta):
	#Call input function
	input = get_input()
	
	#Stop Player Down
	if input == Vector2.ZERO:
		velocity = Vector2.ZERO
		$Timer.stop()
		$Walking.stop()
		
	#Player Runs
	else:
		velocity = (input * delta * speed)
		if $Timer.time_left <= 0:
			$Walking.play()
			$Timer.start(0.2)
		
	
	#In-built function to move
	move_and_slide()
	
	
func player_animation(dir_x, dir_y):
	#Function variables
	var animated_sprite_2d = $AnimatedSprite2D
	
	#Flip along the player sprite
	if dir_x > 0:
		animated_sprite_2d.flip_h = false
	elif dir_x < 0:
		animated_sprite_2d.flip_h = true
	
	#Play animation
	if dir_x == 0 and dir_y == 0:
		animated_sprite_2d.play("Idle")
	else:
		animated_sprite_2d.play("Running")
		
func change_speed():
	if Global.current_scene == 'beach':
		scale.x = 0.75
		scale.y = 0.75
		speed = 10000
	else:
		scale.x = 1
		scale.y = 1
		speed = 5000
