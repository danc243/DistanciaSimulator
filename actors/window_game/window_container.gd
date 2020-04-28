extends ViewportContainer

class_name WindowContainer

onready var viewport = $Viewport
onready var testLevel = preload("res://levels/se_busca/se_busca.tscn").instance()
onready var timerGamer  = $TimerGame
var currentNode

signal handlerTimerStart
signal handlerTimerEnd

func _ready():
	currentNode = testLevel
	viewport.add_child(currentNode)
	timerGamer.initTimer(2)
	
func _on_TimerGame_timer_gamer_out():
	viewport.remove_child(currentNode)
	currentNode = load("res://levels/quedate_en_casa/qudate_en_casa.tscn").instance() as QuedateEnCasaLevel
	currentNode.init(5, "handlerTimerStart", "handlerTimerEnd")
	viewport.add_child(currentNode)

func _on_TimerGame_timer_gamer_start():
	pass
