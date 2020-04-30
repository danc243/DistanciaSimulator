extends Control

onready var nodeHandler = $handler
var elNodoVentana = null
onready var buttons = $buttons

func _ready():
	pass

func _on_Game_Icon_on_pressed_button():
	if nodeHandler.get_child_count() > 0:
		print("El juego ya está activo")
	else:
		var node = load("res://actors/window_game/window_game.tscn")
		elNodoVentana = node.instance()
		var ventana = get_tree().get_root().get_node("Control").get_node("handler")
		ventana.add_child(elNodoVentana)
		var children = buttons.get_children()
		for child in children:
			if child is Button:
				child.mouse_filter = Control.MOUSE_FILTER_IGNORE


func _on_Desktop_Icon_on_pressed_button():
	pass

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("escape") && elNodoVentana!=null):
		elNodoVentana.queue_free()
		elNodoVentana = null
		var children = buttons.get_children()
		for child in children:
			if child is Button:
				child.mouse_filter = Control.MOUSE_FILTER_STOP
