extends Node2D

func _ready() -> void:
	for node in get_tree().get_nodes_in_group('door'):
		node.hide()
		node.process_mode = 4


func _process(delta: float) -> void:
	if get_tree().get_nodes_in_group('enemy').size() == 0:
		for node in get_tree().get_nodes_in_group('door'):
			node.show()
			node.process_mode = 0
			
