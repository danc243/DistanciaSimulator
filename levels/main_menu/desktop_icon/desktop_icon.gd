extends Button


onready var label_name = $RichTextLabel

func _ready():
	label_name.text = name
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func icon_pressed():
	print("Parent Script")

func _on_Desktop_Icon_pressed():
	icon_pressed()

