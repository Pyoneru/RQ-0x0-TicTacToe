extends Sprite

#Load Textures

onready var img_o: Texture = load("res://Images/TTT_Win_O.png")
onready var img_x: Texture = load("res://Images/TTT_Win_X.png")
onready var winner: Texture = load("res://Images/TTT_Winner.png") 
onready var draw: Texture = load("res://Images/TTT_Draw.png") 



# Child node(draw X or O)
onready var XO_Node = $XO

# Set winner signboard
func set_image(xo : String) -> void:
	self.texture = winner
	self.XO_Node.visible = true
	if xo == "X":
		self.XO_Node.texture = img_x
	elif xo == "O":
		self.XO_Node.texture = img_o

# Set draw signboard
func set_draw():
	self.XO_Node.visible = false
	self.texture = draw
