extends Node


func _on_VideoPlayer_finished() -> void:
	get_tree().change_scene("res://levels/main_menu/main_menu.tscn")
	pass # Replace with function body.
