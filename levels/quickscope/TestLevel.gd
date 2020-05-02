extends MinigameLogic

var _enemigosMatados = 0
var _enemigosParaGanar = 3

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if(_enemigosMatados>=3):
		have_won()

func enemy_killed():
	_enemigosMatados+=1
