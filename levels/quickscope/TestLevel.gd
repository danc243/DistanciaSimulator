extends MinigameLogic

var _enemigosMatados = 0
var _enemigosParaGanar = 3

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if(_enemigosMatados>=3):
		connect("show_txt", _window_game, "_on_show_quickes_copes")
		emit_signal("show_txt")
		disconnect("show_txt", _window_game, "_on_show_quickes_copes")
		have_won()

func enemy_killed():
	_enemigosMatados+=1
