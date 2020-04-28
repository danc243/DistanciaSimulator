extends Control


var _buscado: int = 0
onready var _imagen = $"face"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func set_buscado(buscado: int) -> void:
	_buscado = buscado
	_imagen.texture = load(str("res://assets/se_busca/", _buscado, "_Face.png"))
