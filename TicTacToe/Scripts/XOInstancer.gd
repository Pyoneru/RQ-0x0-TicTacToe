extends Node


onready var xo_scene = preload("res://Scenes/XO.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Remove all children
func clear():
	for node in get_children():
		node.queue_free()

# Instance animation xo scene and play animation (X or O, depend on 'xo' arg)
func instance(xo: String, pos: Vector2):
	var node = xo_scene.instance()
	add_child(node)
	node.position = pos
	if xo == "X":
		node.playCross()
	else:
		node.playCircle()
