extends Node

class_name MinigameLogic

signal you_lose
signal you_win

var difficulty
var _window_game: Object

# warning-ignore:shadowed_variable
func init(difficulty: int, referenceParent: Object):
	self._window_game = referenceParent
	self.difficulty = difficulty
	__connect()

func _timer_start():
	pass

func _timer_end():
	have_lost()
	pass

func have_won():
	emit_signal("you_win")
	__disconnect()

func have_lost():
	emit_signal("you_lose")
	__disconnect()

func __disconnect():
	disconnect("you_win", _window_game, "you_win_game")
	disconnect("you_lose", _window_game, "you_lose_game")
	_window_game.disconnect("timerEndsParent", self, "_timer_end")

func __connect():
# warning-ignore:return_value_discarded
	connect("you_win", _window_game, "you_win_game")
# warning-ignore:return_value_discarded
	connect("you_lose", _window_game, "you_lose_game")
# warning-ignore:return_value_discarded
	_window_game.connect("timerEndsParent", self, "_timer_end")

