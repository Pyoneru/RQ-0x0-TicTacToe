extends Area2D


signal clicked(pos)

# Emit clicked signal if left mouse was clicked
func _on_Detector_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.is_pressed():
				emit_signal("clicked", self.position)
