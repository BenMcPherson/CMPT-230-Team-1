extends Node2D

const Battle_Units = preload("res://Resources/Battle_Units.tres")

var max_hp = 40
var hp = max_hp: set = set_hp

var init_atk = 4
var atk = init_atk: set = set_atk

#get instance
@onready var hp_label = $HP_Label
@onready var animated_sprite_2d = $AnimatedSprite2D
signal died
signal end_turn

#When enemy is hurt
func set_hp(new_hp):
	hp = new_hp
	hp_label.text = str(hp) + 'HP'
	
func set_atk(value):
	atk = value

func _ready():
	Battle_Units.Enemy = self

func _exit_tree():
	Battle_Units.Enemy = null

func attack() -> void:
	await(get_tree().create_timer(0.4).timeout)
	animated_sprite_2d.play("Attack")
	$SlashSFX.play()
	await(animated_sprite_2d.animation_finished)
	Battle_Units.PlayerState.take_damage(atk)
	animated_sprite_2d.play("Idle")
	emit_signal("end_turn")

func heal() -> void:
	await(get_tree().create_timer(0.4).timeout)
	self.hp += 1
	animated_sprite_2d.play("Idle")
	emit_signal("end_turn")

func transform() -> void:
	pass
	
func bulk_def() -> void:
	pass
	
func choose_move():
	if hp <= (max_hp/2):
		heal()
	else:
		attack()

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
