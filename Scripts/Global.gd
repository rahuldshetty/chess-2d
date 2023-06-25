extends Node

const starting_position = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"

var BLACK_CELL_COLOR = Color.from_string("#057137", "#000000")
var WHITE_CELL_COLOR = Color.from_string("#cdffb0", "#FFFFFF")
var POS_CHANGE_COLOR = Color.from_ok_hsl(0.45, 0.22, 0.81, 0.7)

const ROW_SIZE = 8
const COL_SIZE = 8

const CELL_WIDTH = 64
const CELL_HEIGHT = 64

const X_OFFSET = 24
const Y_OFFSET = 28

const BOARD_OFFSET_X = 256
const BOARD_OFFSET_Y = 128


var is_whites_turn = 1

var GAME_STATE = {
	"board": starting_position,
	"cells": [],
	"yellow_cells": {},
	"last_moved_cells": []
}
