extends ViewportContainer

class_name WindowContainer

onready var viewport = $Viewport
onready var testLevel = preload("res://levels/se_busca/se_busca.tscn").instance()
onready var timerGamer  = $TimerGame
var currentNode

signal timerEndsParent

func _ready():
	currentNode = testLevel
	viewport.add_child(currentNode)
	timerGamer.initTimer(2)


func _on_TimerGame_timer_gamer_start():
	
	pass

func _on_TimerGame_timer_gamer_out():
	emit_signal("timerEndsParent")
	
	viewport.remove_child(currentNode)
	currentNode = load("res://levels/quedate_en_casa/qudate_en_casa.tscn").instance() as QuedateEnCasaLevel
	currentNode.init(5, self)
	viewport.add_child(currentNode)
	timerGamer.initTimer(5)
	

func you_lose_game():
	print("you_lose_game desde window_container")
	pass
	
func you_win_game():
	print("you_lose_win desde window_container")
	pass
