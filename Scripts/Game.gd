extends BaseScene

@onready var options_UI = $OptionsUI
@onready var exit_button = $OptionsUI/Exit_Button
@onready var camera = $FollowCamera

#Neighbor Hosue Collision detector
@onready var neighbor_collide = $neighbour_house_trigger/NeighborCollide

var is_UI_open = false

# Music
@onready var overworld_music = $OverworldMusic

func toggle_UI():
	# If the UI is already open, close it
	if is_UI_open:
		options_UI.hide()
		is_UI_open = false
	else:
	# If the UI is already closed, open it
		options_UI.show()
		is_UI_open = true


# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	camera.follow_node = player
	#Set-up Global variables
	Global.back_to = "game"
	#Global.back_to = get_tree().current_scene
	Global.current_scene = 'game'
	overworld_music.play()
	#Set-up Dialogic Variables
	Dialogic.VAR.Battle = false
	if Global.tutorial:
		Dialogic.start("Tutorial")
		get_node("StaticBody2D/tutorial_blocker").disabled = false
	if !Global.tutorial:
		if !Dialogic.VAR.CompleteTutorial:
			Dialogic.start("TheBegining")
		get_node("StaticBody2D/tutorial_blocker").disabled = true

func _physics_process(_delta):
	get_node("neighbour_house_trigger/NeighborCollide").disabled = not(Dialogic.VAR.Battle)

func _input(_ev):
	if Input.is_key_pressed(KEY_ESCAPE):
		toggle_UI()

func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/LoadingScreens/LoadMainMenu.tscn")
