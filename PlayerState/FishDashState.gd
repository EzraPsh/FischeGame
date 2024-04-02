class_name DashState
extends BaseFishState

@export var move_state : MoveState

func enter(state_machine : FishStateMachine):
	state_machine.move_fish_impulse(state_machine.transform.x * 1800)
	state_machine.attack_area.enable()
	
func update(state_machine : FishStateMachine):
	pass
	
func phys_update(state_machine : FishStateMachine):
	state_machine.slow_down_mult(0.1)
	
	if state_machine.velocity.length() <= 300:
		if !state_machine.attack_area.enabled:
			state_machine.move_fish_impulse(state_machine.transform.x * -400)
		exit(state_machine)
		state_machine.fish_state = move_state
	
	
func exit(state_machine : FishStateMachine):
	state_machine.attack_area.reset()
