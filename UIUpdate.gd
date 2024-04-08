class_name UIManager
extends Camera2D

var heart_size : float = 128
@onready var heart : TextureRect = $CanvasLayer/Control/Heart

func _ready():
	heart.size.x = heart_size * 5

func change_size(health : int):
	heart.size.x = heart_size * health
	print(heart.scale.x)
