extends Node2D

onready var area = $"ElArea"
onready var _imagen = $"persona"

var _isBuscado: bool = false
var _level: MinigameLogic
var _persona: int = 0

func _ready() -> void:
	_imagen.texture = load(str("res://assets/se_busca/", _persona, ".png"))
	pass

func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if(event.is_action_pressed("left_click") && _isBuscado):
		if _level != null:
			_level.have_won()

func esElBuscado(si:bool, level:MinigameLogic)->void :
	_isBuscado = si
	_level = level as MinigameLogic

func quePersona(persona:int)->void :
	_persona = persona
