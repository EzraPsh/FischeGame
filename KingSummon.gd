extends RigidBody2D

var move_dir = Vector2()
var target : Node2D
var toggle_aim : bool = true

func _ready():
	$AnimationPlayer.play("shark")
	
	target = get_parent().get_node("Fish")

func forward():
	move_dir = transform.x * 50

func _physics_process(delta):
	move_dir = lerp(move_dir, Vector2(0,0), 0.01)
	move_and_collide(move_dir) 
	if toggle_aim:
		aim()
		
func toggle(act : bool):
	toggle_aim = act

func aim():
	look_at(target.global_position)

func destroy():
	queue_free()

func _on_area_2d_body_entered(body):
	if body is FishStateMachine:
		body.take_hit(global_position)
