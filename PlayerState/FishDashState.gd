class_name DashState
extends BaseFishState

@export var move_state : MoveState
@onready var dash_len : Timer = $DashTimer
@onready var momentary_delay : Timer = $DelayControl

func enter(state_machine : FishStateMachine):
	state_machine.move_fish_impulse(state_machine.transform.x * 1800)
	state_machine.attack_area.enable()
	
	dash_len.stop()
	dash_len.start()
	
	await dash_len.timeout
	
	exit(state_machine)
	state_machine.fish_state = move_state
	
func update(state_machine : FishStateMachine):
	pass
	
func phys_update(state_machine : FishStateMachine):
	state_machine.slow_down_mult(0.1)
	
func exit(state_machine : FishStateMachine):
	state_machine.attack_area.reset()

func on_finish_charge(state_machine : FishStateMachine):
	state_machine.move_fish_impulse(state_machine.transform.x * -400)
	
	momentary_delay.stop()
	momentary_delay.start()
	
	await momentary_delay.timeout
	
	exit(state_machine)
	state_machine.fish_state = move_state
	move_state.enter(state_machine)
	print("change")
