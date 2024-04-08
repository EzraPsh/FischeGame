extends Node2D

func _ready():
	Music.stop_music()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/level/Level1Scene.tscn")
	Music.stop_music()
	Music.play_music()
