class_name ArcherFishSM
extends Destructable

@export var fish_state : BaseArcherState
@export var speed : float = 100
@export var fish : Node
@export var bullet : PackedScene
var look_dir : Vector2 = Vector2()

func _ready():
	fish_state.enter(self)
	
func _physics_process(delta):
	fish_state.phys_update(self)
	
func _process(delta):
	fish_state.update(self)

func lookat_player():
	look_dir = lerp(look_dir, fish.global_position, 0.1)
	look_at(look_dir)

func shoot():
	pass
