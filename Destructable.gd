class_name Destructable
extends PhysicsBody2D

@export var health : int

func take_hit():
	health -= 1
	if health <= 0:
		queue_free()
		print("ded")
