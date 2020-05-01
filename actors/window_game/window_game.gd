extends Control

class_name WindowGame

onready var viewport = $WindowContainer/Viewport
onready var timerGamer  = $WindowContainer/TimerGame
onready var life_label = $Lifes/LifeLabel
onready var streak_label = $Streak/StreakLabel

var currentNode = null
var main_menu_reference: MainMenu
const cantidadDeMinijuegos: int = 3

var lifes = 5
var streak = 0

var _rng = RandomNumberGenerator.new()

signal timerEndsParent
signal close_game

func init(reference: MainMenu):
	self.main_menu_reference = reference
	connect("close_game", self.main_menu_reference, "close_the_game")

func _ready():
	_rng.randomize()
	_updateLabels()
	_loadLevel()

func _loadLevel():
	if(currentNode!=null):
		viewport.remove_child(currentNode)
		currentNode.queue_free()
	var ran = _rng.randi_range(0, cantidadDeMinijuegos - 1)
	ran = 3
	var st: String = ""
	match ran:
		0:
			st = "/quedate_en_casa/qudate_en_casa.tscn"
		1:
			st = "/quickscope/TestLevel.tscn"
		2:
			st = "/se_busca/se_busca.tscn"
		3: 
			st = "/vuelve_a_casa/vuelve_a_casa.tscn"
	st = str("res://levels", st)
	currentNode = load(st).instance() as MinigameLogic
	currentNode.init(5, self)
	viewport.add_child(currentNode)
	timerGamer.initTimer(10) 
	pass


func you_lose_game():
	lifes-=1
	if lifes > 0:
		_loadLevel()
		streak = 0
		_updateLabels()
	else:
		emit_signal("close_game")
		disconnect("close_game", self.main_menu_reference, "close_the_game")

func you_win_game():
	streak+=1
	if streak > 5 && lifes < 5:
		lifes+=1
		streak = 0
	_updateLabels()
	_loadLevel()
	
func _updateLabels():
	life_label.text = String(lifes)
	streak_label.text = String(streak)

func _on_TimerGame_timer_gamer_out():
	emit_signal("timerEndsParent")

func _on_TimerGame_timer_gamer_start():
	pass 
