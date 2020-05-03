extends Control

class_name WindowGame

onready var viewport = $WindowContainer/Viewport
onready var timerGamer  = $WindowContainer/TimerGame
onready var life_label = $Lifes/LifeLabel
onready var streak_label = $Streak/StreakLabel

var currentNode = null
var main_menu_reference: MainMenu
const cantidadDeMinijuegos: int = 6

var lifes = 50
var streak = 0

var max_lifes = 5
var max_streak = 5 

var _dificultad = 1
var _lastGame = 0
var _timer = 15
var _minijuegosGanados = 0

var _rng = RandomNumberGenerator.new()

signal timerEndsParent
signal close_game

func init(reference: MainMenu):
	
	self.main_menu_reference = reference
	connect("close_game", self.main_menu_reference, "close_the_game")


func _ready():
	_rng.randomize()
	
	var savegame = get_node("/root/SaveGame")
	var state = savegame.get_first_time_playing()
	
	if(state):
		_dificultad = 0
		_timer = 20
	
	_updateLabels()
	_loadLevel()


func _loadLevel():
	
	_calDificultad()
	
	if(currentNode!=null):
		viewport.remove_child(currentNode)
		currentNode.queue_free()
	
	var ran = _lastGame
	
	if(_dificultad>0):
		while(ran==_lastGame):
			ran = _rng.randi_range(0, cantidadDeMinijuegos - 1)
	else:
		ran = _minijuegosGanados
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
		4: 
			st = "/escapa/escapa.tscn"
		5:
			st = "/george_lucas/level.tscn"
	_lastGame = ran
	st = str("res://levels", st)
	currentNode = load(st).instance() as MinigameLogic
	currentNode.init(_dificultad, self)
	viewport.add_child(currentNode)
	timerGamer.initTimer(10)


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
	if streak < max_streak:
		streak+=1
	if streak >= max_streak && lifes < max_lifes:
		lifes+=1
		streak = 0
	_minijuegosGanados += 1
	_updateLabels()
	_loadLevel()


func _updateLabels():
	life_label.text = String(lifes)
	streak_label.text = String(streak)


func _calDificultad():
	
	match _dificultad:
		0:
			if(_minijuegosGanados == cantidadDeMinijuegos ):
				_dificultad=1
				_timer = 10
				var savegame = get_node("/root/SaveGame")
				savegame.set_first_time_playing(false)
		1:
			if(_minijuegosGanados > 3):
				_dificultad=2
				_timer = 8
			pass
		2:
			if(_minijuegosGanados > 8):
				_dificultad=3
				_timer = 5
			pass

	pass


func _on_TimerGame_timer_gamer_out():
	emit_signal("timerEndsParent")


func _on_TimerGame_timer_gamer_start():
	pass 


func _on_CloseGame_pressed():
	emit_signal("close_game")
	disconnect("close_game", self.main_menu_reference, "close_the_game")

func _on_show_bee_movie_txt():
	main_menu_reference.bee_movie_button.visible = true

func _on_show_se_busca_txt():
	main_menu_reference.se_busca_button.visible = true
	
func _on_show_quickes_copes():
	main_menu_reference.quickes_copes_button.visible = true
	
func _on_show_vuelve_casa():
	main_menu_reference.vuelve_casa_button.visible = true
	
func _on_show_quedate_en_casa():
	main_menu_reference.quedate_en_casa_button.visible = true

func on_show_escapa_txt():
	main_menu_reference.escapa_button.visible = true

