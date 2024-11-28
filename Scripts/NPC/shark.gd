extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D

func _on_area_2d_body_entered(body):
	if body is Player:
		print('In contact with player')
		Global.interact_with_npc = true
		Global.npc = "Shark_Dialogue"


func _on_area_2d_body_exited(_body):
	Global.interact_with_npc = false

func _process(_delta):
	if Global.found_power_up:
		animated_sprite_2d.play("SharkDead")
	else:
		animated_sprite_2d.play("SharkAlive")
