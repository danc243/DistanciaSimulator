extends MinigameLogic

var ha_perdido = false

var _rng = RandomNumberGenerator.new()
onready var Spawners = $CanvasModulate/Spawners

var _playerSpawn: int = 0
var _numSpawns: int = 4
var _virusSpawneds: int = 0

var _player

var _virusSpeed = Vector2(50,50)

func _init() -> void:
	_rng.randomize()
	_playerSpawn = _rng.randi_range(0,_numSpawns-1)
	pass

func _ready() -> void:
	
	match difficulty:
		0:
			_virusSpeed = Vector2(50,50)
			_virusSpawneds = 1
			pass
		1:
			_virusSpeed = Vector2(100,75)
			_virusSpawneds = 1
			pass
		2:
			_virusSpeed = Vector2(110,135)
			_virusSpawneds = 2
			pass
		3:
			_virusSpeed = Vector2(190,190)
			_virusSpawneds = 3
			pass
	pass
	
	_spawnPlayer()
	_spawnVirus()
	pass

func _spawnPlayer():
	var spawns = Spawners.get_child(_playerSpawn)
	var player = preload("res://actors/vuelve_a_casa/Player.tscn").instance()
	player.position = spawns.position
	_player = player
	add_child(player)

func _spawnVirus():
	for i in _virusSpawneds:
		var rngVirus = _playerSpawn
		while(rngVirus==_playerSpawn):
			rngVirus = _rng.randi_range(0,_numSpawns-1)
	
		var spawns = Spawners.get_child(rngVirus)
		var virus = preload("res://actors/escapa/Virus.tscn").instance()
		virus.position = spawns.position
		virus.set_speed(_virusSpeed)
		virus.set_player(_player)
		add_child(virus)

func _process(delta):
	if ha_perdido:
		have_lost()
		ha_perdido = false

func _timer_end():
	var savegame = get_node("/root/SaveGame")
	savegame.set_escapa(true)
	connect("show_txt", _window_game, "on_show_escapa_txt")
	emit_signal("show_txt")
	disconnect("show_txt", _window_game, "on_show_escapa_txt")
	have_won()
