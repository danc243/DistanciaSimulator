extends MinigameLogic

onready var itemlist = $"Control/ItemList"
var _inputsArray = [] #from 0 to 3
var _rng = RandomNumberGenerator.new()
var _inputActual = 0
var _stillPlaying = true
var _LucasState
onready var _victoryTimer = $Timer

var _cantidadInputs: int = 5



func _ready() -> void:
	
	var savegame = get_node("/root/SaveGame")
	_LucasState = savegame.get_george_lucas_state()
	
	_rng.randomize()
	
	match difficulty:
		0:
			_cantidadInputs = 2
			pass
		1:
			_cantidadInputs = 3
			pass
		2:
			_cantidadInputs = 5
			pass
		3:
			_cantidadInputs = 7
			pass
	pass
	
	for i in _cantidadInputs:
		_inputsArray.append(_rng.randi_range(0,3))
		itemlist.add_icon_item(load(str("res://assets/george_lucas/",_inputsArray[i],".png")),false)
	itemlist.rect_min_size = Vector2(_cantidadInputs*68,itemlist.rect_size.y)


func _input(event: InputEvent) -> void:
	if(!_stillPlaying):
		return
	
	if(event.is_action_pressed("move_up")): #0
		_goodOrBadInput(0)
	
	if(event.is_action_pressed("move_down")): #1
		_goodOrBadInput(1)
	
	if(event.is_action_pressed("move_left")): #2
		_goodOrBadInput(2)
		
	if(event.is_action_pressed("move_right")): #3
		_goodOrBadInput(3)


func _goodOrBadInput(i: int):
	if(_inputsArray[_inputActual]==i):
		#var ind = itemlist.get_item_at_position(Vector2(0,_inputActual))
		var ind = _inputActual
		itemlist.set_item_icon(ind, load(str("res://assets/george_lucas/",i,"_good.png")))
		_inputActual+=1
	else:
		have_lost()
		return
	if(_inputActual==_cantidadInputs):
		connect("show_txt", _window_game, "_on_show_bee_movie_txt")
		emit_signal("show_txt")
		disconnect("show_txt", _window_game, "_on_show_bee_movie_txt")
		var savegame = get_node("/root/SaveGame")
		_LucasState += 1
		savegame.set_george_lucas_state(_LucasState)
		_stillPlaying = false
		var timerleft = _window_game.timerGamer.timer.time_left
		if(timerleft<5.0):
			_victoryTimer.wait_time = 5.0-timerleft
			_victoryTimer.start()
			_window_game.timerGamer.timer.paused = true
	return


func _timer_end():
	if(_stillPlaying):
		have_lost()
	else:
		have_won()

func _on_Timer_timeout() -> void:
	_window_game.timerGamer.timer.paused = false
