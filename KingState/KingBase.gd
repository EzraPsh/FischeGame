class_name KingBase
extends Node

func enter(state_machine : KingSM):
	pass
	
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
