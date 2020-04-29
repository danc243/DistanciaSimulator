extends MinigameLogic

export var dificultad: int = 0
var _buscado: int = 0
var _cantidadDePersonas: int = 15
var _tiposDePersonas: int = 3
onready var marco = $"El Buscado"
onready var LasPersonas = $"Las Personas"

var _rng = RandomNumberGenerator.new()

func _ready() -> void:
	_rng.randomize()
	_buscado = _set_buscado()
	_spawnRandomPeople()

func _set_buscado()-> int:
	var out = _rng.randi_range(0, _tiposDePersonas-1)
	marco.set_buscado(out)
	return out

func _spawnRandomPeople() -> void:
	var elNivel = self
	var hardcorePos = Vector2(_rng.randf_range(0,800), _rng.randf_range(0,600))
	
	_spawnPerson(_buscado, true, hardcorePos, elNivel, preload("res://actors/se_busca/Persona.tscn"))
	
	for i in range(_cantidadDePersonas):
		var num = _buscado
		
		while num == _buscado:
			num = _rng.randi_range(0,_tiposDePersonas-1)
		
		var pos = Vector2(_rng.randf_range(0+65,800-65), _rng.randf_range(0+200,600-200))
		
		_spawnPerson(num, false, pos, elNivel, preload("res://actors/se_busca/Persona.tscn"))
		pass
	
	pass

func _spawnPerson(quePersona: int, esElBuscado: bool, pos: Vector2, elNivel, spawnedLoaded):
	var spawned = spawnedLoaded.instance() as Node2D
	spawned.esElBuscado(esElBuscado, elNivel)
	spawned.quePersona(quePersona)
	spawned.position = pos
	spawned.scale = Vector2(0.3,0.3)
	LasPersonas.add_child(spawned)
	pass

func have_won()-> void:
	# wait so how?
	# ._timer_end()
	.have_won()
	print("have_won en se_busca")
	pass

func have_lost()-> void:
	# wait so how?
	# ._timer_end()
	.have_lost()
	pass

func _timer_start():
	print("inició el timer en se_busca")
	._timer_start()
	pass

func _timer_end():
	print ("terminó el timer en se_busca")
	._timer_end()
	pass
