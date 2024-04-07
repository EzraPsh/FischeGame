class_name KnightFishSM
extends Destructable

@export var patrol_direction : Vector2
@export var fish_state : KnightBase
@export var target : Node2D
@onready var anim : AnimationPlayer = $AnimationPlayer

var move_dir : Vector2 = Vector2()
@export var speed : float = 5

func _ready():
	fish_state.enter(self)
	
func _physics_process(delta):
	fish_state.phys_update(self)
	move_and_collide(move_dir)
	
func _process(delta):
	fish_state.update(self)

func move_fish_impulse(dir : Vector2):
	move_dir = dir

func move_fish(dir : Vector2):
	move_dir = lerp(move_dir, dir, 0.2)

func _on_area_2d_body_entered(body):
	fish_state.front_entered(self, body)

func slow_down_mult(mult : float):
	move_dir = lerp(move_dir, Vector2(0,0), mult)

func take_hit(hitpos : Vector2):
	if fish_state.take_hit(self, hitpos):
		super(hitpos)
