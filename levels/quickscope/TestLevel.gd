extends MinigameLogic

var _enemigosMatados = 0
var _enemigosParaGanar = 3

onready var _spawner = $Spawner as Enemy_spawner

func _ready() -> void:
	match difficulty:
		0:
			_spawner._speedRNGRange = Vector2(0,0)
			_spawner._spawnedSpeed = Vector2(200, 0)
			_enemigosParaGanar = 2
			pass
		1:
			_spawner._speedRNGRange = Vector2(100,0)
			_spawner._spawnedSpeed = Vector2(300, 0)
			_enemigosParaGanar = 5
			pass
		2:
			_spawner._speedRNGRange = Vector2(250,0)
			_spawner._spawnedSpeed = Vector2(400, 0)
			_enemigosParaGanar = 4
			pass
		3:
			_spawner._speedRNGRange = Vector2(50,0)
			_spawner._spawnedSpeed = Vector2(500, 0)
			_spawner._baseTimer = 0.4
			_spawner._timerRNGRange = 0.2
			_enemigosParaGanar = 3
			pass
	pass

func _process(delta: float) -> void:
	if(_enemigosMatados>=3):
		have_won()

func enemy_killed():
	_enemigosMatados+=1

func have_won():
	if(difficulty==3):
		var savegame = get_node("/root/SaveGame")
		savegame.set_quick_scopes(true)
		connect("show_txt", _window_game, "_on_show_quickes_copes")
		emit_signal("show_txt")
		disconnect("show_txt", _window_game, "_on_show_quickes_copes")
	.have_won()
