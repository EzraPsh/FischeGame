class_name PlayerBite
extends Area2D

@onready var dest_timer : Timer = $Timer
@export var effect : PackedScene

func _ready():
	dest_timer.stop()
	dest_timer.start()
	
	var inst = effect.instantiate()
	get_parent().add_child(inst)
	inst.global_position = global_position
	
	await dest_timer.timeout
	
	queue_free()

func _on_body_entered(body):
	if body is Destructable:
		body.take_hit(Vector2())
		
	queue_free()
