extends Node

class_name MinigameLogic

signal you_lose
signal you_win

var difficulty
var _reference: Object

func init(difficulty: int, referenceParent: Object):
	self._reference = referenceParent
	self.difficulty = difficulty
	_connect()

func _timer_start():
	# print("inició el timer en nivel")
	pass
	
func _timer_end():
#	todo manejar como se acaba este nivel, poner el flash o video de que perdiste
	_disconnect()
	print ("terminó el timer en nivel")
	pass

func have_won():
	print("have_won en MinigameLogic")
	pass

func have_lost():
	pass

func _disconnect():
	disconnect("you_win", _reference, "you_win_game")
	disconnect("you_lose", _reference, "you_lose_game")
	_reference.disconnect("timerEndsParent", self, "_timer_end")
	pass

func _connect():
	connect("you_win", _reference, "you_win_game")
	connect("you_lose", _reference, "you_lose_game")
	_reference.connect("timerEndsParent", self, "_timer_end")
	pass
