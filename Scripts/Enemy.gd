extends Node2D

const Battle_Units = preload("res://Resources/Battle_Units.tres")

var max_hp = 40
var hp = max_hp: set = set_hp

var init_atk = 4
var atk = init_atk: set = set_atk

var init_def = 1
var def = init_def: set = set_def

var init_mana = 1
var mana = init_mana: set = set_mana

#Enemy animation key
var idle = "Idle"
var damage = 'Attack'
var hurt = 'Hurt'
var death = 'Death'
var dino_mode = 'Null'

#Random
var random = RandomNumberGenerator.new()

#get instance
@onready var hp_label = $HP_Label
@onready var animated_sprite_2d = $AnimatedSprite2D
signal died
signal def_bulk
signal end_turn

#When enemy is hurt
func set_hp(new_hp):
	hp = new_hp
	hp_label.text = str(hp) + 'HP'
	
func set_atk(value):
	atk = value
	
func set_def(value):
	def = value 
	
func set_mana(value):
	mana = value

func _ready():
	Battle_Units.Enemy = self

func _exit_tree():
	Battle_Units.Enemy = null

func attack() -> void:
	print("Attack")
	await(get_tree().create_timer(0.4).timeout)
	animated_sprite_2d.play(damage)
	$SlashSFX.play()
	await(animated_sprite_2d.animation_finished)
	Battle_Units.PlayerState.take_damage(atk)
	animated_sprite_2d.play(idle)
	emit_signal("end_turn")

func heal() -> void:
	print("Heal")
	await(get_tree().create_timer(0.4).timeout)
	self.hp += mana
	animated_sprite_2d.play(idle)
	emit_signal("end_turn")

func transform() -> void:
	print("Transform")
	await(get_tree().create_timer(0.4).timeout)
	#Update Enemy transformation
	dino_mode = 'Dino'
	idle = "Idle"
	damage = 'Attack'
	hurt = 'Hurt'
	death = 'Death'
	#Update states
	self.atk += 4
	self.mana += 2
	#Run game
	animated_sprite_2d.play(idle)
	emit_signal("end_turn")
	
func bulk_def() -> void:
	print("End Turn")
	emit_signal("def_bulk")
	await(get_tree().create_timer(0.4).timeout)
	self.def += 1
	emit_signal("end_turn")
	
func choose_move():
	random.randomize()
	var rng = random.randi_range(0, 2)
	if ( hp <= (max_hp/2) ) and (dino_mode == 'Null'):
		transform()

	if Battle_Units.PlayerState.hp >= (Battle_Units.PlayerState.max_hp)/2:
		if (rng == 0):
			bulk_def()
		else:
			attack()
	else:
		if (rng == 0) and (hp < max_hp):
			heal()
		elif rng == 1:
			attack()
		else:
			bulk_def()

func take_damage(amount):
	if def > init_def:
		self.hp -= amount/def
		self.def = init_def
	else:
		self.hp -= amount/def
		
	if is_dead():
		Global.dead = true
		$DeathSFX.play()
		animated_sprite_2d.play(death)
		await (animated_sprite_2d.animation_finished)
		print('Winner')
		emit_signal("died")
		queue_free()
	else:
		animated_sprite_2d.play(hurt)
		await (animated_sprite_2d.animation_finished)
		animated_sprite_2d.play(idle)
		
func is_dead():
	return self.hp <= 0
