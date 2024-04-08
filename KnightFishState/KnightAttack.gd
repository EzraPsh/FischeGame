class_name KnightAttack
extends KnightBase

var is_attacking : bool = false

@export var patrol_state : KnightPatrol
@export var stun_state : KnightStun
@onready var delay_pre_charge : Timer = $PreAttack
@onready var charge_time : Timer = $ChargeTimer
@export var dash : AudioStreamPlayer2D

func enter(state_machine : KnightFishSM):
	is_attacking = false
	
	state_machine.look_at(state_machine.target.global_position)
	
	delay_pre_charge.stop()
	delay_pre_charge.start()
	await delay_pre_charge.timeout
	
	state_machine.anim.play("Attack")
	dash.play()
	state_machine.look_at(state_machine.target.global_position)
	
	state_machine.move_fish_impulse(state_machine.transform.x * 40)
	is_attacking = true
	
	charge_time.stop()
	charge_time.start()
	await charge_time.timeout
	
	exit(state_machine)
	state_machine.fish_state = patrol_state
	patrol_state.enter(state_machine)
	
func update(state_machine : KnightFishSM):
	pass
	
func phys_update(state_machine : KnightFishSM):
	state_machine.slow_down_mult(0.1)
	
func exit(state_machine : KnightFishSM):
	delay_pre_charge.stop()
	charge_time.stop()

func front_entered(state_machine : KnightFishSM, body : Node2D):
	if is_attacking && body is FishStateMachine:
		print("Player is Hit!")
		body.take_hit(state_machine.global_position)

func take_hit(state_machine : KnightFishSM, hitpos : Vector2) -> bool:
	#if is_attacking:
	#	return false
	if hitpos.length() > 0:
		var force_dir = (state_machine.global_position - hitpos).normalized()
		state_machine.move_fish_impulse(force_dir * 10)
		exit(state_machine)
		state_machine.fish_state = stun_state
		stun_state.enter(state_machine)
	return true
	
