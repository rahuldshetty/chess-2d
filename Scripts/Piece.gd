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
	var x = position.x - Global.X_OFFSET
	var y = position.y - Global.Y_OFFSET
	var file = ((Global.CELL_WIDTH * Global.COL_SIZE - Global.X_OFFSET) - x) / Global.CELL_WIDTH 
	var rank = ((Global.CELL_HEIGHT * Global.ROW_SIZE - Global.Y_OFFSET) - y) / Global.CELL_HEIGHT
	print("File:", file)
	print("Rank:", file)
	

func handle_mouse_press(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			mouse_pressed = true
		else:
			position.x = original_position[0]
			position.y = original_position[1]
			check_whether_current_mouse_pos_is_valid_cell()
			mouse_pressed = false

func _process(_delta):
	if mouse_pressed:
		position.x = get_global_mouse_position().x - 256
		position.y =  get_global_mouse_position().y - 128




	
