extends AnimatedSprite

const animation_circle_name = "Circle"
const animation_cross_name = "Cross"

func playCircle() -> void:
	self.play(animation_circle_name)
	
func playCross() -> void:
	self.play(animation_cross_name)
