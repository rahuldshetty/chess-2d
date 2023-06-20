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

const X_OFFSET = 24
const Y_OFFSET = 28


func _ready():
	load_fen_string(Global.GAME_STATE['board'])
	
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

func draw_cell(file, rank, cell):
	if cell >= "1" and cell <= "8":
		return int(cell)
	
	var piece = map_to_cell(cell).instantiate()

	piece.position.x = file * CELL_WIDTH + 8 + X_OFFSET
	piece.position.y = rank * CELL_WIDTH + 4 + Y_OFFSET
	
	if is_instance_of(piece, Piece):
		piece.rank = rank
		piece.file = file
	
	cell_position.add_child(piece)
	
	return 1

func load_fen_string(fen_str):
	var file = 0;
	var rank = 0;
	
	var board = fen_str.split(' ')[0]
	
	for symbol in board:
		if symbol == "/":
			file = 0
			rank += 1
		else:
			if symbol >= "1" and symbol <= "9":
				file += int(symbol)
			else:
				draw_cell(file, rank, symbol)
				file += 1
