extends AnimatedSprite


const animation_circle_name = "Circle"
const animation_cross_name = "Cross"

export(int) var test = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if test == 0:
		playCircle()
	else:
		playCross()

func playCircle():
	self.play(animation_circle_name)
	
func playCross():
	self.play(animation_cross_name)

func _on_XO_animation_finished():
	print("Animation finished")
