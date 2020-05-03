extends Actor

var _player = self as Actor
var _self = self as Actor

func _physics_process(delta: float) -> void:
	var direction: = get_direction()
	_velocity = calc_move_velocity(direction, speed)
	_velocity = move_and_slide(_velocity, Vector2.ZERO)


func get_direction() -> Vector2:
#	var ang = _player.position.angle_to(_self.position)
#	var yes = Vector2()
	var dir = ( _player.position - _self.position ).normalized()
	return dir

func set_player(player: Actor):
	_player = player
	pass
