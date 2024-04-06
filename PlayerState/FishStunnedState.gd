class_name FishStun
extends BaseFishState

@export var default_state : MoveState
@onready var stun_timer : Timer = $StunTimer

func enter(state_machine : FishStateMachine):
	
	stun_timer.stop()
	stun_timer.start()

	await stun_timer.timeout
	
	exit(state_machine)
	state_machine.fish_state = default_state
	default_state.enter(state_machine)
	
func phys_update(state_machine : FishStateMachine):
	state_machine.slow_down_mult(0.05)

func take_hit(state_machine : FishStateMachine, hitpos : Vector2):
	state_machine.health_manager.take_damage()
