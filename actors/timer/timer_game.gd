extends Control

class_name TimerGamer

var _color_green = Color(0.141176, 0.411765, 0.266667,1)
var _color_red = Color(0.486275, 0.152941, 0.152941,1)

onready var rect = $ColorRect
onready var timer: Timer = $Timer
var _initialTime = 10.0

signal timer_gamer_out
signal timer_gamer_start

func _ready():
	rect.color = _color_green

func _process(delta):
	var time_left = timer.time_left
	var scaleB = (time_left)/ _initialTime
	rect.anchor_right = scaleB
	if time_left >= 0.0:
		var currentColor = rect.color
		var newColor = _color_red.linear_interpolate(_color_green, scaleB)
		rect.color = newColor

func initTimer(wait_time: float):
	timer.wait_time = wait_time
	_initialTime  = wait_time
	timer.start()
	emit_signal("timer_gamer_start")
	pass

func _on_Timer_timeout():
	emit_signal("timer_gamer_out")
