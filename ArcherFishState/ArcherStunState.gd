class_name ArcherStun
extends BaseArcherState

@export var default_state : ArcherDefault
@onready var stun_timer : Timer = $StunTimer

func enter(state_machine : ArcherFishSM):
	
	stun_timer.stop()
	stun_timer.start()
	
	state_machine.apply_torque_impulse(7)
	
	await stun_timer.timeout
	
	exit(state_machine)
	state_machine.fish_state = default_state
	default_state.enter(state_machine)
	
func update(state_machine : ArcherFishSM):
	pass
	
func phys_update(state_machine : ArcherFishSM):
	state_machine.slow_down_mult(0.05)
	
func exit(state_machine : ArcherFishSM):
	state_machine.look_dir = state_machine.transform.x
