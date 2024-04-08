extends Node2D

@export var strings : Array[String]
@export var image2 : CompressedTexture2D
@export var image3 : CompressedTexture2D
@export var image4 : CompressedTexture2D
@export var image5 : CompressedTexture2D

var counter = 0
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if strings.size() == counter:
		get_tree().change_scene_to_file('res://Scenes/MainScene.tscn')
		return  # move to the main scene
	$Label.text = strings[counter]
	if counter == 2:
		$Sprite.texture = image2
	if counter == 4:
		$Sprite.texture = image3
	if counter == 6:
		$Sprite.texture = image4
	if counter == 8:
		$Sprite.texture = image5
	counter += 1
