extends Node2D

@export var white_cell : PackedScene
@export var black_cell : PackedScene

enum Cell {
	WHITE,
	BLACK
}

func _ready():
	draw_board()

func _draw():
	draw_yellow_cells()

func _process(_delta):
	queue_redraw()
	
func draw_cell(x, y, color):
	var row = x * Global.CELL_WIDTH
	var col = y * Global.CELL_HEIGHT
	var piece = null
	match color:
		Cell.WHITE:
			piece = white_cell.instantiate()
		Cell.BLACK:
			piece = black_cell.instantiate()
	piece.position.x = row 
	piece.position.y = col
	piece.size.x = Global.CELL_WIDTH
	piece.size.y = Global.CELL_HEIGHT
	
	Global.GAME_STATE['cells'].append(piece)
	
	add_child(piece)

func draw_board():
	for i in range(Global.ROW_SIZE):
		for j in range(Global.COL_SIZE):
			# even cell colored white
			if ( i + j ) % 2 == 0:
				draw_cell(i, j, Cell.WHITE)
			else:
				draw_cell(i, j, Cell.BLACK)


func draw_yellow_cells():
	if len(Global.GAME_STATE['last_moved_cells']) == 2:
		for move_coordinate in Global.GAME_STATE['last_moved_cells']:
			var row = move_coordinate[0] * Global.CELL_WIDTH
			var col = move_coordinate[1] * Global.CELL_HEIGHT
			
			draw_rect(
				Rect2(
					col, 
					row, 
					Global.CELL_WIDTH, 
					Global.CELL_HEIGHT
				), 
				Global.POS_CHANGE_COLOR, 
				true
			)

