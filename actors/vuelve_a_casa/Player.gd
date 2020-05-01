extends Actor

func _on_EnemyDetector_body_entered(body: PhysicsBody2D) -> void:
	#you_lose
	get_node("player").visible = false
	queue_free()

func _physics_process(delta: float) -> void:
	var direction: = get_direction()
	_velocity = calc_move_velocity(direction, speed)
	_velocity = move_and_slide(_velocity, Vector2.ZERO)


func get_direction()  -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
