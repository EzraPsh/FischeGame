class_name ArcherDefault
extends BaseArcherState

func enter(state_machine : ArcherFishSM):
	pass
	
func update(state_machine : ArcherFishSM):
	state_machine.lookat_player()
	
	if state_machine.look_dir.distance_to(state_machine.fish.global_position) <= 50:
		print("shoot!")
	
func phys_update(state_machine : ArcherFishSM):
	pass
	
	
func exit(state_machine : ArcherFishSM):
	pass
