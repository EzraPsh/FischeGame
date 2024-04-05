class_name AttackArea
extends Area2D

signal attack_hit

var enabled : bool = false

func _on_body_entered(body):
	attack_hit.emit()
	if enabled && body is Destructable:
		body.take_hit(global_position)
		enabled = false

func reset():
	enabled = false

func enable():
	enabled = true
