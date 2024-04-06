class_name KnightBase
extends Node

func enter(state_machine : KnightFishSM):
	pass
	
func update(state_machine : KnightFishSM):
	pass
	
func phys_update(state_machine : KnightFishSM):
	pass
	
func exit(state_machine : KnightFishSM):
	pass

func front_entered(state_machine : KnightFishSM, body : Node2D):
	pass

func take_hit(state_machine : KnightFishSM, hitpos : Vector2) -> bool:
	return false
