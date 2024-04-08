class_name KingSM
extends Destructable

@export var patrol_direction : Vector2
@export var fish_state : KingBase
@export var target : Node2D
@export var shark : PackedScene
@onready var anim : AnimationPlayer = $AnimationPlayer
var pos_init : Vector2 = Vector2()
#@onready var anim : AnimationPlayer = $AnimationPlayer

func _ready():
	fish_state.enter(self)
	pos_init = global_position
	
func _physics_process(delta):
	#global_position = pos_init
	fish_state.phys_update(self)
	
func _process(delta):
	fish_state.update(self)

func take_hit(hitpos : Vector2):
	if fish_state.take_hit(self, hitpos):
		super(hitpos)

func summon_shark():
	var dir = target.global_position + (new_direction() * 300)
	
	var inst = shark.instantiate()
	get_parent().add_child(inst)
	inst.global_position = dir
	print("summon at " + str(dir))
	
func new_direction() -> Vector2:
	var new_dir = Vector2()
	new_dir.x = randf_range(-1, 1)
	new_dir.y = randf_range(-1, 1)
	return new_dir.normalized()
