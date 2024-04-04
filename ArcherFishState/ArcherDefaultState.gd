class_name ArcherDefault
extends BaseArcherState

@export var archer_anim : AnimationPlayer
@export var stun_state : ArcherStun

func enter(state_machine : ArcherFishSM):
	print(state_machine.look_dir)
	pass
	
func update(state_machine : ArcherFishSM):
	state_machine.lookat_player()
	
	if state_machine.look_dir.distance_to(state_machine.fish.global_position) <= 50:
		archer_anim.play("attack_state")
	else:
		archer_anim.play("idle_state")
	
func phys_update(state_machine : ArcherFishSM):
	state_machine.slow_down_mult(0.2)
	
	
func exit(state_machine : ArcherFishSM):
	pass

func take_hit(state_machine : ArcherFishSM, hitpos : Vector2):
	var force_dir = (state_machine.global_position - hitpos).normalized()
	state_machine.move_fish(force_dir * 10)
	state_machine.fish_state = stun_state
	stun_state.enter(state_machine)
