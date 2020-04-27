extends "res://levels/main_menu/desktop_icon/desktop_icon.gd"

func _ready():
	pass
	
func __icon_pressed():
	var node = load("res://actors/window_game/window_container.tscn")
	var instance = node.instance()
	var ventana = get_tree().get_root().get_node("Control").get_node("handler")
	ventana.add_child(instance)
	pass

