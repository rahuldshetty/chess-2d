class_name Piece
extends Sprite2D

var rank = 0
var file = 0
var is_white:bool

var mouse_pressed

var history = []

func _ready():
	var original_position = [
		position.x, position.y, file, rank
	]
	history.append(original_position)
	
func check_whether_current_mouse_pos_is_valid_cell():
	var x = position.x - Global.BOARD_OFFSET_X
	var y = position.y - Global.BOARD_OFFSET_Y
	var loc_file = Global.COL_SIZE - int( ((Global.CELL_WIDTH * Global.COL_SIZE - Global.BOARD_OFFSET_X) - x) / Global.CELL_WIDTH ) - 1
	var loc_rank = int( ((Global.CELL_HEIGHT * Global.ROW_SIZE - Global.BOARD_OFFSET_Y) - y) / Global.CELL_HEIGHT )
	loc_rank = ( Global.ROW_SIZE - 1 - loc_rank)
	# print("File:", char(file + 65), " ", file)
	# print("Rank:", rank)
	if not (history[-1][2] == loc_file and history[-1][3] == loc_rank) and ((is_white and Global.is_whites_turn) or (not is_white and not Global.is_whites_turn)) and (loc_file >= 0 and loc_file < Global.COL_SIZE and loc_rank >= 1 and loc_rank <= Global.ROW_SIZE):
		return {
			"valid": true,
			"file": loc_file,
			"file_chr":  char(loc_file + 65),
			"rank": loc_rank,
		}
	else:
		return { "valid": false }
	

func handle_mouse_press(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			mouse_pressed = true
		else:
			var validity = check_whether_current_mouse_pos_is_valid_cell()
			if not validity['valid']:
				position.x = history[-1][0]
				position.y = history[-1][1]
			else:
				var loc_rank = validity['rank']
				var loc_file = validity['file']
				
				position.x = loc_file * Global.CELL_WIDTH + 8 + Global.X_OFFSET
				position.y = loc_rank * Global.CELL_WIDTH + 4 + Global.Y_OFFSET
				Global.is_whites_turn = not Global.is_whites_turn
				history.append(
					[position.x, position.y, loc_file, loc_rank]
				)
				var items:Array = []
				items.insert(
					0, [history[-1][3], history[-1][2]]
				)
				items.insert(
					0, [history[-2][3], history[-2][2]]
				)
				Global.GAME_STATE['last_moved_cells'] = items
				
				
			mouse_pressed = false

func _process(_delta):
	if mouse_pressed:
		position.x = get_global_mouse_position().x - 256
		position.y =  get_global_mouse_position().y - 128




	
