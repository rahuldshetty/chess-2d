extends Node2D

@export var white_cell : PackedScene
@export var black_cell : PackedScene

const ROW_SIZE = 8
const COL_SIZE = 8

const CELL_WIDTH = 64
const CELL_HEIGHT = 64

enum Cell {
	WHITE,
	BLACK
}

func _ready():
	draw_board()

func draw_cell(x, y, color):
	var row = x * CELL_WIDTH
	var col = y * CELL_HEIGHT
	var piece = null
	match color:
		Cell.WHITE:
			piece = white_cell.instantiate()
		Cell.BLACK:
			piece = black_cell.instantiate()
	piece.position.x = row 
	piece.position.y = col
	piece.size.x = CELL_WIDTH
	piece.size.y = CELL_HEIGHT
	add_child(piece)		

func draw_board():
	for i in range(ROW_SIZE):
		for j in range(COL_SIZE):
			# even cell colored white
			if ( i + j ) % 2 == 0:
				draw_cell(i, j, Cell.WHITE)
			else:
				draw_cell(i, j, Cell.BLACK)

