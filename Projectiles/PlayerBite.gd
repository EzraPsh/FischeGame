class_name PlayerBite
extends Area2D

@onready var dest_timer : Timer = $Timer

func _ready():
	dest_timer.stop()
	dest_timer.start()
	
	await dest_timer.timeout
	
	queue_free()

func _on_body_entered(body):
	if body is Destructable:
		body.take_hit(Vector2())
		
	queue_free()
