extends Control

class_name MainMenu

onready var messageButton = $buttons/Mensaje
onready var buttons = $buttons
onready var nodeHandler = $handler
onready var txtHandler = $TxtHandler
var window_game = null


func _ready():
	var savegame = get_node("/root/SaveGame")
	var george_state = savegame.get_george_lucas_state()
	messageButton.visible = george_state > 0



func _on_Game_Icon_on_pressed_button():
	if nodeHandler.get_child_count() > 0:
		print("El juego ya está activo")
	else:
		var node = load("res://actors/window_game/window_game.tscn") 
		window_game = node.instance()
		window_game.init(self)
		var ventana = get_tree().get_root().get_node("Control").get_node("handler")
		ventana.add_child(window_game)
		_setButtons(MOUSE_FILTER_IGNORE)
		

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("escape") && window_game!=null):
		window_game.queue_free()
		window_game = null
		_setButtons(MOUSE_FILTER_STOP)

func close_the_game():
	window_game.queue_free()
	window_game = null
	_setButtons(MOUSE_FILTER_STOP)

func _setButtons(mouseFilter):
	var children = buttons.get_children()
	for child in children:
		if child is Button:
			child.mouse_filter = mouseFilter



func _on_Mensaje_on_pressed_button():
	txtHandler.visible = true
	_setButtons(MOUSE_FILTER_IGNORE)

func _on_CloseTXTButton_pressed():
	txtHandler.visible = false
	_setButtons(MOUSE_FILTER_STOP)
