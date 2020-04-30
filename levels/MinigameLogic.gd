extends Node

class_name MinigameLogic

signal you_lose
signal you_win

var difficulty
var _reference: Object

func init(difficulty: int, referenceParent: Object):
	self._reference = referenceParent
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
	pass

func have_lost():
	emit_signal("you_lose")
	__disconnect()
	pass

func __disconnect():
	disconnect("you_win", _reference, "you_win_game")
	disconnect("you_lose", _reference, "you_lose_game")
	_reference.disconnect("timerEndsParent", self, "_timer_end")
	pass

func __connect():
	connect("you_win", _reference, "you_win_game")
	connect("you_lose", _reference, "you_lose_game")
	_reference.connect("timerEndsParent", self, "_timer_end")
	pass
