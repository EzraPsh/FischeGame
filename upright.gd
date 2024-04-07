extends Sprite2D

func _process(delta):
	if get_parent().transform.x[0] < 0:
		scale.y = -0.25
	else:
		scale.y = 0.25
