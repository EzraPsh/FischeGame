class_name MoveState
extends BaseFishState

@export var dash_state : DashState

func enter(state_machine : FishStateMachine):
	pass
	
func update(state_machine : FishStateMachine):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		state_machine.fish_state = dash_state
		dash_state.enter(state_machine)
		
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		print("Basic Attack!")
	
func phys_update(state_machine : FishStateMachine):
	if Input.get_vector("left", "right", "up", "down"):
		var move_amount = state_machine.speed * Input.get_vector("left", "right", "up", "down")
		state_machine.move_fish(move_amount)
	else:
		state_machine.slow_down()
	state_machine.lookat_mouse()
	
func exit(state_machine : FishStateMachine):
	pass
