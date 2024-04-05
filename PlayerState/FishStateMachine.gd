class_name FishStateMachine
extends CharacterBody2D

@export var health_manager : PlayerHealth
@export var attack_area : AttackArea
@export var fish_state : BaseFishState 
@export var speed : float = 100

@export var bite : PackedScene 
@onready var atack_point : Node = $AttackPoint

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

func _on_attack_area_attack_hit():
	fish_state.on_finish_charge(self)

func take_hit(dir : Vector2):
	if abs(dir.length()) <= 0:
		pass
	health_manager.take_damage()

func bite_attack():
	var bite_inst = bite.instantiate()
	atack_point.add_child(bite_inst)
	bite_inst.global_position = atack_point.global_position
	bite_inst.global_rotation = atack_point.global_rotation
	pass
