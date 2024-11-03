extends Node2D

var hp = 25: set = set_hp

@onready var hp_label = $HP_Label
@onready var animated_sprite_2d = $AnimatedSprite2D
signal died

func set_hp(new_hp):
	hp = new_hp
	if hp < 0: # Adjustment so that HP does not appear negative in game file
		hp = 0
	hp_label.text = str(hp) + 'HP'
	
	if hp <= 0:
		#Remove node
		animated_sprite_2d.play("Death")
		$DeathSFX.play()
		await (animated_sprite_2d.animation_finished)
		emit_signal("died")
		queue_free()
	else:
		animated_sprite_2d.play("Hurt")
		await (animated_sprite_2d.animation_finished)
		animated_sprite_2d.play("Attack")
		await (animated_sprite_2d.animation_finished)
		$SlashSFX.play()
		var combat = get_tree().current_scene
		var player = combat.find_child("Player_States")
		player.hp -= 3
		animated_sprite_2d.play("Idle")
