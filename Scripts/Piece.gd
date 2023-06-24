class_name Piece
extends Sprite2D

var rank = 0
var file = 0

var mouse_pressed

var original_position;

func _ready():
	original_position = [
		position.x, position.y
	]
	
func check_whether_current_mouse_pos_is_valid_cell():
	var x = position.x - Global.BOARD_OFFSET_X
	var y = position.y - Global.BOARD_OFFSET_Y
	var file = Global.COL_SIZE - int( ((Global.CELL_WIDTH * Global.COL_SIZE - Global.BOARD_OFFSET_X) - x) / Global.CELL_WIDTH ) - 1
	var rank = int( ((Global.CELL_HEIGHT * Global.ROW_SIZE - Global.BOARD_OFFSET_Y) - y) / Global.CELL_HEIGHT ) + 1
	# print("File:", char(file + 65), " ", file)
	# print("Rank:", rank)
	if file >= 0 and file < Global.COL_SIZE and rank >= 1 and rank <= Global.ROW_SIZE:
		return {
			"valid": true,
			"file": file,
			"file_chr":  char(file + 65),
			"rank": rank - 1,
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
				position.x = original_position[0]
				position.y = original_position[1]
			else:
				position.x = validity['file'] * Global.CELL_WIDTH + 8 + Global.X_OFFSET
				position.y = ( Global.ROW_SIZE - 1 - validity['rank']) * Global.CELL_WIDTH + 4 + Global.Y_OFFSET
				original_position[0] = position.x
				original_position[1] = position.y
			mouse_pressed = false

func _process(_delta):
	if mouse_pressed:
		position.x = get_global_mouse_position().x - 256
		position.y =  get_global_mouse_position().y - 128




	
