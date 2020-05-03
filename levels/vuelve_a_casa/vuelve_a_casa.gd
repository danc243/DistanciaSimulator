extends MinigameLogic

var ha_ganado = false

var _rng = RandomNumberGenerator.new()
onready var Spawners = $CanvasModulate/Spawners

var _playerSpawn: int = 0
var _numSpawns: int = 4

func _init() -> void:
	_rng.randomize()
	_playerSpawn = _rng.randi_range(0,_numSpawns-1)
	pass

func _ready() -> void:
	_spawnPlayer()
	pass

func _spawnPlayer():
	var spawns = Spawners.get_child(_playerSpawn)
	var player = preload("res://actors/vuelve_a_casa/Player.tscn").instance()
	player.position = spawns.position
	add_child(player)

func _process(delta):
	if ha_ganado:
		var savegame = get_node("/root/SaveGame")
		savegame.set_vuelve_casa(true)
		connect("show_txt", _window_game, "_on_show_vuelve_casa")
		emit_signal("show_txt")
		disconnect("show_txt", _window_game, "_on_show_vuelve_casa")
		have_won()
		ha_ganado = false
