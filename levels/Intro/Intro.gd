extends Node

onready var video = $VideoPlayer

func _ready() -> void:
	video.play()

func _on_VideoPlayer_finished() -> void:
	get_tree().change_scene("res://levels/main_menu/main_menu.tscn")
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("action") || event.is_action_pressed("escape") :
		get_tree().change_scene("res://levels/main_menu/main_menu.tscn")
