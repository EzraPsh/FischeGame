class_name KingSummon
extends KingBase

@export var default_state : KingIdle
@onready var summon_timer : Timer = $SummonTimer
var timer_mult : float = 1
var base_wait : float = 1.5

func enter(state_machine : KingSM):
	summon_timer.wait_time = base_wait * timer_mult
	
	state_machine.anim.play("Attack")
	state_machine.summon_shark()
	
	summon_timer.stop()
	summon_timer.start()
	
	await summon_timer.timeout
	
	state_machine.anim.play("Attack")
	state_machine.summon_shark()
	
	summon_timer.stop()
	summon_timer.start()
	
	await summon_timer.timeout
	
	state_machine.anim.play("Attack")
	state_machine.summon_shark()
	
	summon_timer.stop()
	summon_timer.start()
	
	await summon_timer.timeout
	
	state_machine.anim.play("Attack")
	state_machine.summon_shark()
	
	summon_timer.stop()
	summon_timer.start()
	
	await summon_timer.timeout
	
	exit(state_machine)
	state_machine.fish_state = default_state
	default_state.enter(state_machine)
	
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
