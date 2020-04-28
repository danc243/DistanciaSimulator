extends Node2D

onready var area = $"ElArea"

var _isBuscado: bool = false
var _level: Node2D

func _ready() -> void:
	pass

func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if(event.is_action_pressed("left_click") && _isBuscado):
		_level.yes()

func esElBuscado(si:bool, level:Node2D)->void :
	_isBuscado = si
	_level = level
