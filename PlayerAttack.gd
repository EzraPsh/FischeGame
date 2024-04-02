class_name AttackArea
extends Area2D

var enabled : bool = false

func _on_body_entered(body):
	if enabled && body is Destructable:
		print("Dest Entered!")
		body.take_hit()
		enabled = false

func reset():
	enabled = false

func enable():
	enabled = true
