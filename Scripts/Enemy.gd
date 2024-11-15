extends Node2D

const Battle_Units = preload("res://Resources/Battle_Units.tres")

var hp = 25: set = set_hp

#get instance
@onready var hp_label = $HP_Label
@onready var animated_sprite_2d = $AnimatedSprite2D
signal died
signal end_turn

#When enemy is hurt
func set_hp(new_hp):
	hp = new_hp
	hp_label.text = str(hp) + 'HP'

func _ready():
	Battle_Units.Enemy = self

func _exit_tree():
	Battle_Units.Enemy = null

func attack() -> void:
	await(get_tree().create_timer(0.4).timeout)
	animated_sprite_2d.play("Attack")
	$SlashSFX.play()
	await(animated_sprite_2d.animation_finished)
	Battle_Units.PlayerState.hp -= 4
	animated_sprite_2d.play("Idle")
	emit_signal("end_turn")


func take_damage(amount):
	self.hp -= amount
	if is_dead():
		$DeathSFX.play()
		animated_sprite_2d.play("Death")
		await (animated_sprite_2d.animation_finished)
		emit_signal("died")
		queue_free()
	else:
		animated_sprite_2d.play("Hurt")
		await (animated_sprite_2d.animation_finished)
		animated_sprite_2d.play("Idle")
		
func is_dead():
	return hp <= 0
