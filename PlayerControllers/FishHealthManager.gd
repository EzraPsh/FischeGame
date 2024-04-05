class_name PlayerHealth
extends Node

@export var max_health : int
var curr_health = 0

func _ready():
	curr_health = max_health
	
func take_damage():
	curr_health -= 1
	
func is_alive() -> int:
	return curr_health > 0
