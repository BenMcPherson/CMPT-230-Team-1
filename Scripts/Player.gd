extends CharacterBody2D

#Player Variables
const speed = 100
@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	var direction_x = Input.get_axis("Move_Left", "Move_Right")
	var direction_y = Input.get_axis("Move_Up", "Move_Down")
	
	#Animation function
	player_animation(direction_x)
	
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
	
func player_animation(dir):
	#Function variables
	if dir > 0:
		animated_sprite_2d.flip_h = false
	elif dir < 0:
		animated_sprite_2d.flip_h = true
		
	if dir == 0:
		animated_sprite_2d.play("Idle")
	else:
		animated_sprite_2d.play("Running")
