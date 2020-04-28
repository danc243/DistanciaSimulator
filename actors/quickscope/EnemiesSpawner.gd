extends Node2D

export var centro: = Vector2.ZERO
export var left: = 0.0
export var right: = 1920.0
export var up: = 0.0
export var down: = 1080.0

export var _baseTimer:= 1.5
export var _addedTimer: = 5.0
export var _timerRNGRange:= 1.0

export var _spawnedSpeed:= Vector2(1500,0)
export var _speedRNGRange:= Vector2(500,0)

var _rng = RandomNumberGenerator.new()

# 6.5 segundos, con un 1s de rango
# Le quitas un cuarto de segundo cada vez que a cierta a un enemigo
# Solo puede llegar a 1.5s de minimo

func _ready() -> void:
	startTimer()

func _on_Timer_timeout() -> void:
	spawnEnemy()
	startTimer()

####

func spawnEnemy() -> void:
	var spawned = preload("Enemy.tscn").instance()
	spawned.init(Vector2(0,centro.y), Vector2.ZERO, calculateSpeed())
	get_parent().get_node("Spawner").add_child(spawned)

func calculateTimer() -> float:
	var out = _baseTimer + _addedTimer + _rng.randf_range(-_timerRNGRange, _timerRNGRange)
	return out

func calculateSpeed() -> Vector2:
	var out = _spawnedSpeed + Vector2(_rng.randf_range(-_speedRNGRange.x, _speedRNGRange.x), 0)
	return out

func startTimer() -> void:
	get_node("Timer").wait_time = calculateTimer();
	get_node("Timer").start()

func lowerAddedTimer() -> void:
	if (_addedTimer <= 0):
		_addedTimer = 0
		return
	_addedTimer -= 0.25



func _on_Area2D_body_entered(body: Node) -> void:
	body.queue_free()
