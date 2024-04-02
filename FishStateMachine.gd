class_name FishStateMachine
extends CharacterBody2D

@export var attack_area : AttackArea
@export var fish_state : BaseFishState 
@export var speed : float = 100

func _ready():
	fish_state.enter(self)
	
func _physics_process(delta):
	fish_state.phys_update(self)
	move_and_slide()
	
func _process(delta):
	fish_state.update(self)

func move_fish(dir : Vector2):
	velocity = lerp(velocity, dir, 0.2)
	
func move_fish_impulse(dir : Vector2):
	velocity = dir

func slow_down():
	velocity = lerp(velocity, Vector2(0,0), 0.05)
	
func slow_down_mult(mult : float):
	velocity = lerp(velocity, Vector2(0,0), mult)

func lookat_mouse():
	look_at(get_global_mouse_position())
