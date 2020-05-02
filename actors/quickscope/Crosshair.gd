extends Node2D

var _losQuicks:= VideoPlayer.new()

func _ready() -> void:
	_losQuicks = get_node("../Quickscope")


func _input(event: InputEvent) -> void:
	var si: Area2D
	if(event.is_action_pressed("action") && !_losQuicks.is_playing()):
		
		var oye = get_node("Shooting").get_overlapping_bodies()

		_losQuicks.quickscop()
		
		if(oye.size()==0):
			return
		
		for si in oye:
			si.queue_free()
			find_parent("TestLevel").enemy_killed()
		
		# If you are here, play sound
		# Also show hitmark for x amout of seconds and quickscore animation
	
	return

