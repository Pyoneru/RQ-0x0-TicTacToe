extends Node
class_name XOLogic

#Current player(X or O) by default start from X
var symbol: String = "X"

var in_game: bool = true

# Board state
var board = [
	["-", "-", "-"],
	["-", "-", "-"],
	["-", "-", "-"]
]

# Win Type
enum WinType {
	HORIZONTAL,
	VERTICAL,
	DIAGONAL,
	NONE,
}


# Set all fields in board to "-"
# and active game
func clear() -> void:
	for x in range(3):
		for y in range(3):
			board[x][y] = "-"
	self.in_game = true


# Set field to X or Y(symbol) and check win
# If win then emit signal
# Otherwise flip symbol
# if field was changed, return true
# Otherwise return false
func set_field(x: int, y: int) -> bool:
	if self.board[x][y] == "-":
		self.board[x][y] = symbol
		if not win_check(x, y):
			flip()
		return true
	return false

# Flip symbol( X to O and O to X)
# Return changed symbol
func flip() -> String:
	if self.symbol == "X":
		self.symbol = "O"
	else:
		self.symbol = "X"
	return self.symbol


# Signal to notification about win
signal win(winner, x, y, type)

# Check all possible win and emit singal if found any win
# return false if not found win, and true in otherwise
func win_check(x: int, y: int) -> bool:
	var xo: String = board[x][y]
	var win_type: int
	
	win_type = horizontal_win_check(x, y, xo)
	if win_type == self.WinType.NONE:
		win_type = vertical_win_check(x, y, xo)	
	if win_type == self.WinType.NONE:
		win_type = left_diagonal_win_check(x, y, xo)
	if win_type == self.WinType.NONE:
		win_type = right_diagonal_win_check(x, y, xo)
		
	if win_type != self.WinType.NONE:
		self.in_game = false
		emit_signal("win", board[x][y], x, y, win_type)
		return true
		
	return false


# Check if all fields in the same row have the same symbol(xo) 
func horizontal_win_check(x: int, y: int, xo: String):
	if board[0][y] == xo and board[1][y] == xo and board[2][y] == xo:
		return self.WinType.HORIZONTAL
	return self.WinType.NONE

# Check if all fields in the same column have the same symbol(xo)	
func vertical_win_check(x : int, y: int, xo: String) -> int:
	if board[x][0] == xo and board[x][1] == xo and board[x][2] == xo:
		return self.WinType.VERTICAL
	return self.WinType.NONE
	
# Check if all field in the left diagnal(from left-up to right-down)
# have the same symbol(xo)
func left_diagonal_win_check(x: int, y: int, xo: String) -> int:
	if (x == 0 and y == 0)  or (x == 1 and y == 1) or (x == 2 and y == 2):
		if board[0][0] == xo and board[1][1] == xo and board[2][2] == xo:
			return self.WinType.DIAGONAL 
	return self.WinType.NONE
	
# Check if all field in the right diagnal(from right-up to left-down)
# have the same symbol(xo)
func right_diagonal_win_check(x: int, y: int, xo: String) -> int:
	if (x == 2 and y == 0) or (x == 1 and y == 1) or (x == 0 and y == 2):
		if board[2][0] == xo and board[1][1] == xo and board[0][2] == xo:
			return self.WinType.DIAGONAL
	return self.WinType.NONE


















	
