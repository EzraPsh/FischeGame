extends StaticBody2D

func _physics_process(delta):
	move_and_collide(transform.x * 10)



func _on_area_2d_body_entered(body):
	if body is FishStateMachine:
		body.take_hit(Vector2())
		
	queue_free()
