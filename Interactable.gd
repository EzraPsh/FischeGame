extends Node2D

var button = preload("res://Interactable/InteractButton.tscn")
var button_icon : Sprite2D = null
var is_in_range = false
@export var dialogue : Array[String]
var counter = 0
var prev_label : Label = null
func _process(delta: float) -> void:
	pass
		

func _input(event: InputEvent) -> void:
	var just_pressed = event.is_pressed() and not event.is_echo()
	if Input.is_key_pressed(KEY_E) and just_pressed and is_in_range :
		print("something")
		if prev_label and is_instance_valid(prev_label):
			prev_label.queue_free()
			prev_label = null
		if counter == dialogue.size():
			button_icon.show()
			counter = 0
		else:
			button_icon.hide()
			prev_label = Label.new()
			prev_label.text = dialogue[counter]
			counter += 1
			add_child(prev_label)
			prev_label.position -= Vector2(0,50)

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
