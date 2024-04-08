class_name KingVulnerable
extends KingBase

@onready var vulnerable_time : Timer = $VulnTimer
@export var default_state : KingIdle

func enter(state_machine : KingSM):
	
	state_machine.anim.play("Stun")
	
	vulnerable_time.stop()
	vulnerable_time.start()
	await vulnerable_time.timeout
	
	exit(state_machine)
	state_machine.fish_state = default_state
	default_state.enter(state_machine)
	pass
	
func update(state_machine : KingSM):
	pass
	
func phys_update(state_machine : KingSM):
	pass
	
func exit(state_machine : KingSM):
	pass

func take_hit(state_machine : KingSM, hitpos : Vector2) -> bool:
	return true
