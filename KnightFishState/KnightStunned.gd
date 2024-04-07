class_name KnightStun
extends KnightBase

@export var default_state : KnightPatrol
@onready var stun_timer : Timer = $StunTimer

func enter(state_machine : KnightFishSM):
	state_machine.anim.play("Stun")
	
	stun_timer.stop()
	stun_timer.start()
	
	state_machine.apply_torque_impulse(7)
	
	await stun_timer.timeout
	
	exit(state_machine)
	state_machine.fish_state = default_state
	default_state.enter(state_machine)
	
func update(state_machine : KnightFishSM):
	pass
	
func phys_update(state_machine : KnightFishSM):
	state_machine.slow_down_mult(0.05)
	
func exit(state_machine : KnightFishSM):
	pass
	#state_machine.look_dir = state_machine.transform.x

func front_entered(state_machine : KnightFishSM, body : Node2D):
	pass

func take_hit(state_machine : KnightFishSM, hitpos : Vector2):
	pass
