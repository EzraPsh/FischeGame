class_name MoveState
extends BaseFishState

@export var dash_state : DashState
@export var stun_state : FishStun
@export var bite_sound : AudioStreamPlayer2D

func enter(state_machine : FishStateMachine):
	state_machine.anim.play("Idle")
	
func update(state_machine : FishStateMachine):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		state_machine.fish_state = dash_state
		dash_state.enter(state_machine)
		
	if Input.is_action_just_pressed("bite"):
		state_machine.bite_attack()
		bite_sound.play()
	
func phys_update(state_machine : FishStateMachine):
	if Input.get_vector("left", "right", "up", "down"):
		var move_amount = state_machine.speed * Input.get_vector("left", "right", "up", "down")
		state_machine.move_fish(move_amount)
	else:
		state_machine.slow_down()
	state_machine.lookat_mouse()
	
func exit(state_machine : FishStateMachine):
	pass

func take_hit(state_machine : FishStateMachine, dir : Vector2):
	if abs(dir.length()) > 0:
		var force_dir = (state_machine.global_position - dir).normalized()
		state_machine.move_fish_impulse(force_dir * 1000)
		state_machine.fish_state = stun_state
		stun_state.enter(state_machine)
	state_machine.health_manager.take_damage()
