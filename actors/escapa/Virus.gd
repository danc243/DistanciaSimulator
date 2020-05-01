extends Actor

func _physics_process(delta: float) -> void:
	var direction: = get_direction()
	_velocity = calc_move_velocity(direction, speed)
	_velocity = move_and_slide(_velocity, Vector2.ZERO)


func get_direction() -> Vector2:
	#TODO BASED ON PLAYER POSITION
	return Vector2.ZERO
