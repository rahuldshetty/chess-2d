extends Node

const starting_position = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"

const ROW_SIZE = 8
const COL_SIZE = 8

const CELL_WIDTH = 64
const CELL_HEIGHT = 64

const X_OFFSET = 24
const Y_OFFSET = 28

var GAME_STATE = {
	"board": starting_position
}
