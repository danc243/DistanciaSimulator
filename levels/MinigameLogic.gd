extends Node

class_name MinigameLogic

signal you_lose
signal you_win

var difficulty
var _reference: Object

func init(difficulty: int, referenceParent: Object):
	self._reference = referenceParent
	self.difficulty = difficulty
	connect("you_win", _reference, "you_win_game")
	connect("you_lose", _reference, "you_lose_game")
	referenceParent.connect("timerEndsParent", self, "_timer_end")

func _timer_start():
	print("inició el timer en nivel")
	pass
	
func _timer_end():
#	todo manejar como se acaba este nivel, poner el flash o video de que perdiste
	disconnect("you_win", _reference, "you_win_game")
	disconnect("you_lose", _reference, "you_lose_game")
	_reference.disconnect("timerEndsParent", self, "_timer_end")
	print ("terminó el timer en nivel")
	pass
