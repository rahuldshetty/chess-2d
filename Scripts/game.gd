extends Node2D

@export var white_pawn:PackedScene
@export var white_bishop:PackedScene
@export var white_king:PackedScene
@export var white_knight:PackedScene
@export var white_queen:PackedScene
@export var white_rook:PackedScene

@export var black_pawn:PackedScene
@export var black_bishop:PackedScene
@export var black_king:PackedScene
@export var black_knight:PackedScene
@export var black_queen:PackedScene
@export var black_rook:PackedScene

@onready var cell_position:Node2D = $Board/PieceLocation

const ROW_SIZE = 8
const COL_SIZE = 8

const CELL_WIDTH = 64
const CELL_HEIGHT = 64

var CELLS = [
	"rnbqkbnr",
	"pppppppp",
	"8",
	"8",
	"8",
	"8",
	"PPPPPPPP",
	"RNBQKBNR"
]

func _ready():
	draw_cells()
	
func map_to_cell(cell):
	match cell:
		"r": return black_rook;
		"R": return white_rook;
		"n": return black_knight;
		"N": return white_knight;
		"b": return black_bishop;
		"B": return white_bishop;
		"q": return black_queen;
		"Q": return white_queen;
		"k": return black_king;
		"K": return white_king;
		"p": return black_pawn;
		"P": return white_pawn;

func draw_cell(x, y, cell):
	if cell >= "1" and cell <= "8":
		return int(cell)
	
	var piece = map_to_cell(cell).instantiate()

	piece.position.x = x * CELL_WIDTH + 8
	piece.position.y = y * CELL_WIDTH + 4
	
	cell_position.add_child(piece)
	
	return 1

func draw_cells():
	var row = 0
	for cell_row in CELLS:
		var col = 0
		for cell in cell_row:
			col += draw_cell(col, row, cell)
		row += 1
		
		
