extends ViewportContainer

class_name WindowContainer

onready var viewport = $Viewport
onready var timerGamer  = $TimerGame
var currentNode = null
const cantidadDeMinijuegos: int = 3

var lifes = 5

var _rng = RandomNumberGenerator.new()

signal timerEndsParent

func _ready():
	_rng.randomize()
	_loadLevel()


func _on_TimerGame_timer_gamer_start():
	
	pass

func _on_TimerGame_timer_gamer_out():
	emit_signal("timerEndsParent")
	_loadLevel()

func _loadLevel()->void:
	if(currentNode!=null):
		viewport.remove_child(currentNode)
		currentNode.queue_free()
	
	var ran = _rng.randi_range(0, cantidadDeMinijuegos - 1)
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
	lifes  = lifes - 1
	print("you lose")
	pass
	
func you_win_game():
	print("you win")	
	pass
