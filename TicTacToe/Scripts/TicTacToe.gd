extends Node2D

# Manage for drawing X or O and clear it.
onready var instancer = $XOInstancer

# Contains Tic Tac Toe logic
onready var logic: XOLogic = $XOLogic

# Signboard for display winner
onready var winner_node = $WinnerSignboard

# Score lavel
onready var score_label = $Score

var x_win_score = 0
var o_win_score = 0

func _ready():
	restart()
	update_score_label_text()
	
func restart():
	self.logic.clear()
	self.winner_node.visible = false
	self.instancer.clear()

# Update score label 
func update_score_label_text() -> void:
	score_label.text = "|X|   " + String(x_win_score) + " : " + String(o_win_score) + "   |O|"

# If game is done then after left mouse click, restart game
func _input(event) -> void:
	if not self.logic.in_game:
		if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT:
				if event.is_pressed():
					restart()

func make_move(x: int, y: int, pos: Vector2) -> void:
	if self.logic.in_game: # do action only if game is actually "in game" mode
		if self.logic.board[x][y] == '-': # if board in (x,y) place has "-" then:
			self.instancer.instance(self.logic.symbol, pos) # draw symbol(X/O)
			self.logic.set_field(x, y) # update field in logic

# Callback for clicked field
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
#-------------------------------------


# if found winner, display it and update score
func _on_XOLogic_win(winner, x, y, type):
	if winner == "X":
		winner_node.set_image("X")
		x_win_score += 1
	else:
		winner_node.set_image("O")
		o_win_score += 1
	update_score_label_text()
	winner_node.visible = true


func _on_XOLogic_draw():
	winner_node.set_draw()
	winner_node.visible = true
