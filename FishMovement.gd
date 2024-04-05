extends CharacterBody2D

@export var speed : float
@onready var anim : AnimationTree = $AnimationTree
var can_move = true

func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		anim.set("parameters/conditions/attack", true)
		
	pass

func _physics_process(delta):

	var player_input = Input.get_vector("left", "right", "up", "down")
	
	if can_move:
		lookat_mouse()
		velocity = move_player()
	
	move_and_slide()

func move_player() -> Vector2:
	var player_input = Input.get_vector("left", "right", "up", "down")
	return player_input * speed

func lookat_mouse():
	look_at(get_global_mouse_position())

func move_set(cond : bool):
	can_move = cond

func charge_control():
	velocity = transform.x * 500
	pass

func set_anim_cond(prop : String, cond : bool):
	anim.set(prop, cond)
