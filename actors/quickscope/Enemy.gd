extends KinematicBody2D

var _velocity: = Vector2.ZERO
var _iniPos: = Vector2.ZERO
var _endPos: = Vector2.ZERO

func init(iniPos: Vector2, endPos: Vector2, velocity:= Vector2(3000,0)) -> void:
	_iniPos = iniPos
	_endPos = endPos
	_velocity = velocity

func _ready() -> void:
	var offset:= Vector2.ZERO
	
	# Puede que tengamos que mover esto de posicion
	
	if (_iniPos.x>0):
		offset.x+=200
	else:
		offset.x-=200
	
	
	# igual y va cuando lo spawneamos
	
	position = _iniPos+offset
	

func _physics_process(delta: float) -> void:
	# Por ahora empieza en la mitad de la pantalla izquierda
	# Y va hasta la derecha
	move_and_slide(_velocity)


# TODO: CALCULATE VELOCITY PER FRAME TO GET TO THE OTHER SIDE OF THE SCREEN
# TODO: Make sure it always passes thought the middle

