extends KinematicBody2D
class_name Actor

export var speed: = Vector2(300.0, 300.0)
var _velocity: = Vector2.ZERO
onready var icon = $icon

func _physics_process(delta: float) -> void:
	self.position
	if(_velocity.length()>0.0):
		icon.rotation = _velocity.angle()
	pass

func calc_move_velocity(
	direction: Vector2,
	speed: Vector2
) -> Vector2:
	
	var out: = Vector2.ZERO
	
	out.x = speed.x * direction.x
	out.y = speed.y * direction.y
	
	return out


func set_speed(speed: Vector2):
	self.speed = speed
