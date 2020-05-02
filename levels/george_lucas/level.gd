extends MinigameLogic

onready var itemlist = $"Control/ItemList"
var _inputsArray = [] #from 0 to 3
var _rng = RandomNumberGenerator.new()
var _inputActual = 0
var _stillPlaying = true

var _cantidadInputs: int = 5

func _ready() -> void:
	
	_rng.randomize()
	
	for i in _cantidadInputs:
		_inputsArray[i] = _rng.randi_range(0,3)
		itemlist.add_icon_item(load(str("res://assets/george_lucas/",_inputsArray[i],".png")),false)
	
	itemlist.rect_min_size = Vector2(_cantidadInputs*68,itemlist.rect_size.y)
	
	
func init(difficulty: int, referenceParent: Object):
	.init(difficulty, referenceParent)
	referenceParent.timerGamer.initTimer(3)
	pass

func _input(event: InputEvent) -> void:
	if(!_stillPlaying):
		return
	
	if(event.is_action_pressed("move_up")): #0
		_goodOrBadInput(0)
	
	if(event.is_action_pressed("move_down")): #1
		_goodOrBadInput(1)
	
	if(event.is_action_pressed("move_right")): #2
		_goodOrBadInput(2)
		
	if(event.is_action_pressed("move_left")): #3
		_goodOrBadInput(3)


func _goodOrBadInput(i: int):
	if(_inputsArray[_inputActual]==i):
		var ind = itemlist.get_item_at_position(Vector2(_inputActual,0))
		itemlist.set_item_icon(ind, load(str("res://assets/george_lucas/",i,"_good.png")))
		_inputActual+=1
	else:
		have_lost()
		return
	
	if(_inputActual==_cantidadInputs):
		_stillPlaying = false
		#TODO CHANGE TIMER
	return

func _timer_end():
	if(_stillPlaying):
		have_lost()
	else:
		have_won()
