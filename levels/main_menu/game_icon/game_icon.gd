extends "res://levels/main_menu/desktop_icon/desktop_icon.gd"


func _ready():
	pass
	
func __icon_pressed():
	get_tree().change_scene("res://levels/mad_max/mad_max.tscn")
