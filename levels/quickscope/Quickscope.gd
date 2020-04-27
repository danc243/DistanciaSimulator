extends VideoPlayer

func _init() -> void:
	visible = false

func quickscop() -> void:
	visible = true
	play()

func _on_Quickscope_finished() -> void:
	visible = false
