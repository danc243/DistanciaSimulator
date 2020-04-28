extends Node

onready var character = $Node2D/AreaCharacter
onready var collision = $Node2D/Area2D/CollisionShape2D
var difficulty

signal you_lose
signal you_win

class_name QuedateEnCasaLevel

func _ready():
#	todo setear el movimiento en Y, mientras más dificil, más se mueve
	pass


func init(difficulty: int, signal_timer_start: String, signal_timer_end: String):
	self.difficulty = difficulty
	connect(signal_timer_start,self, "_timer_start")
	connect(signal_timer_end, self, "_timer_end")

func _timer_start():
	pass
	
func _timer_end():
	pass

func _input(event):
	if event.is_action_pressed("action"):
		character.translate(Vector2(0, -(30)))

func _on_AreaCharacter_area_entered(area):
	emit_signal("you_lose")
