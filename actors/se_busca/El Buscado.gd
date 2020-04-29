extends Control

var _buscado: int = 0
onready var _imagen = $"face"


func set_buscado(buscado: int) -> void:
	_buscado = buscado
	_imagen.texture = load(str("res://assets/se_busca/", _buscado, "_Face.png"))
