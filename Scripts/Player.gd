extends CharacterBody2D

#New Player Movement
'''
#Movement Variables
@onready var speed = 200
@onready var acel = 180
const friction = 500

var input = Vector2.ZERO

func _physics_process(delta):
	player_movement(delta)

func get_input():
	input.x = Input.get_action_strength("Move_Right") - Input.get_action_strength("Move_Left")
	input.y = Input.get_action_strength("Move_Down") - Input.get_action_strength("Move_Up")
	print(input.x, input.y, input)
	return input.normalized()
	
func player_movement(delta):
	input = get_input()
	
	#Slow Player Down
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	#Speed Player Up
	else:
		velocity += (input * acel * delta)
		velocity = velocity.limit_length(speed) 
	move_and_slide()
#Old Player Movement
'''
#Player Variables
const speed = 100
@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	var direction_x = Input.get_axis("Move_Left", "Move_Right")
	var direction_y = Input.get_axis("Move_Up", "Move_Down")
	
	#Animation function
	player_animation(direction_x, direction_y)
	
	#Horizontal Direction
	if direction_x:
		velocity.x = direction_x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	if direction_y:
		velocity.y = direction_y * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)
	move_and_slide()
	
func player_animation(dir_x, dir_y):
	#Function variables
	if dir_x > 0:
		animated_sprite_2d.flip_h = false
	elif dir_x < 0:
		animated_sprite_2d.flip_h = true
		
	if dir_x == 0 and dir_y == 0:
		animated_sprite_2d.play("Idle")
	else:
		animated_sprite_2d.play("Running")
