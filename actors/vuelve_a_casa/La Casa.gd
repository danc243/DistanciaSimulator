extends Area2D

func _ready() -> void:
	pass


func _on_La_Casa_body_entered(body: Node) -> void:
	find_parent("Level").have_won()
	#print("gano")
	pass # Replace with function body.
