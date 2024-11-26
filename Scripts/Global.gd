extends Node

#Check if player has access to Shark power and Milkman
var found_power_up = false
var found_companion = false

#Update when enemy has died
var dead = false

#Update for player turn
var turn = true

#Will control game access; Only for tutorials
var turorial = true

var interact_with_npc = false
