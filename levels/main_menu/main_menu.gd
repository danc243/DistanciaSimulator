extends Control

onready var nodeHandler = $handler

func _ready():
	pass

func _on_Game_Icon_on_pressed_button():
	if nodeHandler.get_child_count() > 0:
		print("El juego ya está activo")
	else:
		var node = load("res://actors/window_game/window_container.tscn")
		var instance = node.instance()
		var ventana = get_tree().get_root().get_node("Control").get_node("handler")
		ventana.add_child(instance)


func _on_Desktop_Icon_on_pressed_button():
	print("Desktop icon presionado en Control Root")
	pass
