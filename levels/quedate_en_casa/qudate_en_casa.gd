extends MinigameLogic

onready var character = $Node2D/AreaCharacter
onready var collision = $Node2D/Area2D/CollisionShape2D

class_name QuedateEnCasaLevel

func _input(event):
	if event.is_action_pressed("action"):
		character.translate(Vector2(0, -(30)))

func _on_AreaCharacter_area_entered(area):
	have_lost()

func _timer_end():
	have_won()
