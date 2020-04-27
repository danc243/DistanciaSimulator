extends ViewportContainer

class_name WindowContainer

onready var viewport = $Viewport
onready var testLevel = preload("res://levels/quickscope/TestLevel.tscn").instance()
onready var timerGamer  = $TimerGame
var currentNode

func _ready():
	currentNode = testLevel
	viewport.add_child(currentNode)
	pass

func _input(event):
	pass
#	if event.is_action_pressed("ui_up") && viewport.is_a_parent_of(currentNode):
#		viewport.remove_child(currentNode)
#		currentNode = load("res://actors/timer/timer.tscn").instance()
#		viewport.add_child(currentNode)

func _on_TimerGame_timer_gamer_out():
	print("Se acabó desde el padre")
