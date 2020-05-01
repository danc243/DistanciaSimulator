extends MinigameLogic

var ha_perdido = false

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
	_spawnVirus()
	pass

func _spawnPlayer():
	var spawns = Spawners.get_child(_playerSpawn)
	var player = preload("res://actors/vuelve_a_casa/Player.tscn").instance()
	player.position = spawns.position
	add_child(player)

func _spawnVirus():
	var rngVirus = _playerSpawn
	while(rngVirus==_playerSpawn):
		rngVirus = _rng.randi_range(0,_numSpawns-1)

	var spawns = Spawners.get_child(rngVirus)
	var virus = preload("res://actors/escapa/Virus.tscn").instance()
	virus.position = spawns.position
	add_child(virus)

func _process(delta):
	if ha_perdido:
		have_lost()
		ha_perdido = false

func _timer_end():
	have_won()
	pass
