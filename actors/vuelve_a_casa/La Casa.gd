extends Area2D

func _on_La_Casa_body_entered(body: Node) -> void:
	find_parent("Level").ha_ganado = true
