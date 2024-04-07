class_name KnightPatrol
extends KnightBase

var curr_dir = Vector2()
@export var charge_state : KnightAttack
@export var stun_state : KnightBase

func enter(state_machine : KnightFishSM):
	state_machine.anim.play("Idle")
	curr_dir = state_machine.patrol_direction
	state_machine.transform.x = curr_dir
	
func update(state_machine : KnightFishSM):
	pass
	
func phys_update(state_machine : KnightFishSM):
	state_machine.move_fish(curr_dir * state_machine.speed)
	
	if (state_machine.target.global_position - state_machine.global_position).length() < 200:
		exit(state_machine)
		state_machine.fish_state = charge_state
		charge_state.enter(state_machine)
	
func exit(state_machine : KnightFishSM):
	pass

func front_entered(state_machine : KnightFishSM, body : Node2D):
	state_machine.transform.x = -curr_dir
	curr_dir = -curr_dir

func take_hit(state_machine : KnightFishSM, hitpos : Vector2) -> bool:
	if hitpos.length() > 0:
		var force_dir = (state_machine.global_position - hitpos).normalized()
		state_machine.move_fish_impulse(force_dir * 10)
		state_machine.fish_state = stun_state
		stun_state.enter(state_machine)
	return true
