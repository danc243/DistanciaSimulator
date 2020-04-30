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
	__disconnect()
	pass

func have_won():
	pass

func have_lost():
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
