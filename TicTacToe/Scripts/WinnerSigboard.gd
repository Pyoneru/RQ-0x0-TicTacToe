extends Sprite


# Path to O image
onready var img_o: Texture = load("res://Images/TTT_Win_O.png")

# Path to X image
onready var img_x: Texture = load("res://Images/TTT_Win_X.png") 

# Child node(draw X or O)
onready var XO_Node = $XO

# Set if under winner sign display X or O as winner
func set_image(xo : String) -> void:
	if xo == "X":
		self.XO_Node.texture = img_x
	elif xo == "O":
		self.XO_Node.texture = img_o
