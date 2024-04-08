extends Node2D


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/cutscene/CutsceneStart.tscn")
	Music.play_music()
