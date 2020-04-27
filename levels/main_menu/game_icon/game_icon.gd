extends "res://levels/main_menu/desktop_icon/desktop_icon.gd"

func _ready():
	pass
	
func __icon_pressed():
	var node = load("res://actors/window_game/window_container.tscn")
	var instance = node.instance()
	
#	instance.set_global_position(Vector2(200,150))
	get_node("/root").add_child(instance)
	pass

