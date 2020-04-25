extends Control

var _color_green = Color(0.141176, 0.411765, 0.266667,1)
var _color_red = Color(0.486275, 0.152941, 0.152941,1)

onready var rect = $ColorRect
onready var timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	rect.color = _color_green

func _process(delta):
	var time_left = timer.time_left
	var scaleB = (time_left)/ 10
	rect.anchor_right = scaleB
	
	if time_left >= 0.0:
		var currentColor = rect.color
		
		var newColor = _color_red.linear_interpolate(_color_green, scaleB)
#		var newColor = currentColor.linear_interpolate(_color_red, 1)
		rect.color = newColor


func _on_Timer_timeout():
	print("Se acabó")
	pass # Replace with function body.
