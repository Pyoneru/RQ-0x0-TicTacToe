extends Node2D

onready var xo_scene = preload("res://XO/XO.tscn")
onready var logic: XOLogic = $XOLogic

#onready var score_label = $Score
var x_win_score = 0
var o_win_score = 0

func _ready():
	#update_score_label_text()
	pass
	
#func update_score_label_text():
#	score_label.text = "[X] " + String(x_win_score) + ":" + String(o_win_score) + "[O]"


func instance_xo(pos: Vector2):
	var node = xo_scene.instance()
	add_child(node)
	node.position = pos
	if self.logic.symbol == "X":
		node.playCross()
	else:
		node.playCircle()


func make_move(x: int, y: int, pos: Vector2):
	if self.logic.in_game:
		if self.logic.board[x][y] == '-':
			instance_xo(pos)
			self.logic.set_field(x, y)

func _on_LeftUp_clicked(pos):
	make_move(0, 0, pos)


func _on_Up_clicked(pos):
	make_move(0, 1, pos)


func _on_RightUp_clicked(pos):
	make_move(0, 2, pos)


func _on_Left_clicked(pos):
	make_move(1, 0, pos)


func _on_Middle_clicked(pos):
	make_move(1, 1, pos)


func _on_Right_clicked(pos):
	make_move(1, 2, pos)


func _on_LeftDown_clicked(pos):
	make_move(2, 0, pos)


func _on_Down_clicked(pos):
	make_move(2, 1, pos)

func _on_RightDown_clicked(pos):
	make_move(2, 2, pos)


func _on_XOLogic_win(winner, x, y, type):
	print("Win: " + winner)
	pass # Replace with function body.
