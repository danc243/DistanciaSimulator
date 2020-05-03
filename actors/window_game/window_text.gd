extends Control

class_name WindowText

signal close_window

onready var txt : RichTextLabel = $ColorRect/TxtLabel

func _on_CloseTXTButton_pressed():
	emit_signal("close_window")
