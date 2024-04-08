extends Node2D

@export var next_scene : PackedScene
var button = preload("res://Interactable/InteractButton.tscn")
var button_icon : Sprite2D = null
var is_in_range = false
var prev_label : Label = null

func _ready():
	$AnimationPlayer.play("Vortex")

func _input(event: InputEvent) -> void:
	var just_pressed = event.is_pressed() and not event.is_echo()
	if Input.is_key_pressed(KEY_E) and just_pressed and is_in_range :
		get_tree().change_scene_to_packed(next_scene)

func _on_area_2d_body_entered(body: Node2D) -> void:
	is_in_range = true
	button_icon = button.instantiate()
	button_icon.position -= Vector2(0, 50)
	body.add_child(button_icon)


func _on_area_2d_body_exited(body: Node2D) -> void:
	is_in_range = false
	if button_icon:
		button_icon.queue_free()
	if is_instance_valid(prev_label):
		prev_label.queue_free()
