extends Control

signal close_window

onready var txt : RichTextLabel = $ColorRect/TxtLabel

func _on_CloseTXTButton_pressed():
	emit_signal("close_window")
