extends Node

onready var character = $Node2D/AreaCharacter
onready var collision = $Node2D/Area2D/CollisionShape2D
var difficulty

signal you_lose
signal you_win
var _reference: Object

class_name QuedateEnCasaLevel

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

func _input(event):
	if event.is_action_pressed("action"):
		character.translate(Vector2(0, -(30)))

func _on_AreaCharacter_area_entered(area):
	emit_signal("you_lose")
