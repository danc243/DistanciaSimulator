extends Button

onready var label_name = $RichTextLabel
signal on_pressed_button

func _ready():
	label_name.text = name
	pass 

func __icon_pressed():
	emit_signal("on_pressed_button")

func _on_Desktop_Icon_pressed():
	__icon_pressed()
