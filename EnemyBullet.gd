extends StaticBody2D

func _physics_process(delta):
	move_and_collide(transform.x * 10)
