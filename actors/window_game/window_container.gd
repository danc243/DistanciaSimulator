extends ViewportContainer

class_name WindowContainer

onready var viewport = $Viewport
onready var testLevel = preload("res://levels/se_busca/se_busca.tscn").instance()
onready var timerGamer  = $TimerGame
var currentNode
const cantidadDeMinijuegos: int = 3

var _rng = RandomNumberGenerator.new()

signal timerEndsParent

func _ready():
	_rng.randomize()
	currentNode = testLevel
	viewport.add_child(currentNode)
	timerGamer.initTimer(2)


func _on_TimerGame_timer_gamer_start():
	
	pass

func _on_TimerGame_timer_gamer_out():
	emit_signal("timerEndsParent")
	_loadLevel()

func _loadLevel()->void:
	viewport.remove_child(currentNode)
	
	var ran = _rng.randi_range(0, cantidadDeMinijuegos-1)
	var st: String = ""
	
	match ran:
		0:
			st = "/quedate_en_casa/qudate_en_casa.tscn"
		1:
			st = "/quickscope/TestLevel.tscn"
		2:
			st = "/se_busca/se_busca.tscn"
	
	st = str("res://levels", st)
	
	currentNode = load(st).instance() as MinigameLogic
	currentNode.init(5, self)
	viewport.add_child(currentNode)
	timerGamer.initTimer(5) 
	pass

func you_lose_game():
	print("you_lose_game desde window_container")
	pass
	
func you_win_game():
	print("you_lose_win desde window_container")
	pass
