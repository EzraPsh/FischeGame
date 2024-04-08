extends Node2D

@export var strings : Array[String]
@export var image2 : CompressedTexture2D


var counter = 0
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if strings.size() == counter:
		get_tree().change_scene_to_file("res://Scenes/Win.tscn")
		return
	$Label.text = strings[counter]
	if counter == 11:
		$Sprite.texture = image2
	counter += 1
