extends Node2D

export var dificultad: int = 0
var _buscado: int = 0
var _cantidadDePersonas: int = 0
var _tiposDePersonas: int = 3
onready var marco = $"El Buscado"

var _rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_rng.randomize()
	_buscado = _set_buscado()
	
	var spawned = preload("res://actors/se_busca/Persona.tscn").instance()
	spawned.esElBuscado(true, get_node("../Level"))
	get_node("Las Personas").add_child(spawned)


func _set_buscado()-> int:
	var out = _rng.randi_range(0, _tiposDePersonas-1)
	marco.set_buscado(out)
	return out

func yes()-> void:
	print("lmao")
