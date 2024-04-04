class_name ArcherFishSM
extends Destructable

@export var fish_state : BaseArcherState
@export var speed : float = 100
@export var fish : Node
@export var bullet : PackedScene
var look_dir : Vector2 = Vector2()
var move_dir : Vector2 = Vector2()

func _ready():
	fish_state.enter(self)
	
func _physics_process(delta):
	fish_state.phys_update(self)
	move_and_collide(move_dir)
	
func _process(delta):
	fish_state.update(self)

func lookat_player():
	look_dir = lerp(look_dir, fish.global_position, 0.01)
	look_at(look_dir)

func shoot():
	print("shoot")
	
func slow_down_mult(mult : float):
	move_dir = lerp(move_dir, Vector2(0,0), mult)

func take_hit(hitpos : Vector2):
	fish_state.take_hit(self, hitpos)
	super(hitpos)
	
func move_fish(dir : Vector2):
	move_dir = dir
