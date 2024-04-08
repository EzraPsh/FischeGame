class_name PlayerHealth
extends Node

@export var max_health : int
var health_ui : UIManager
var curr_health = 0

func _ready():
	curr_health = max_health
	
func set_health_ui(ui : UIManager):
	health_ui = ui
	
func take_damage():
	curr_health -= 1
	health_ui.change_size(curr_health)
	if !is_alive():
		get_tree().change_scene_to_file("res://lose.tscn")
	
func is_alive() -> bool:
	return curr_health > 0
