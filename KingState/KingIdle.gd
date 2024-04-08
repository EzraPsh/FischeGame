class_name KingIdle
extends KingBase

@export var summon_state : KingSummon
@export var stun_state : KingVulnerable
@onready var wait_interval : Timer = $WaitTimer
@export var summon_times : int = 3
var curr_summon_time : int = 0

func enter(state_machine : KingSM):
	state_machine.anim.play("Idle")
	if curr_summon_time == summon_times:
		exit(state_machine)
		state_machine.fish_state = stun_state
		stun_state.enter(state_machine)
		curr_summon_time = 0
		return
	else:
		curr_summon_time += 1
	
	wait_interval.stop()
	wait_interval.start()
	await wait_interval.timeout
	
	exit(state_machine)
	state_machine.fish_state = summon_state
	summon_state.enter(state_machine)
	
func update(state_machine : KingSM):
	pass
	
func phys_update(state_machine : KingSM):
	pass
	
func exit(state_machine : KingSM):
	pass

func front_entered(state_machine : KingSM, body : Node2D):
	pass

func take_hit(state_machine : KingSM, hitpos : Vector2) -> bool:
	return false
