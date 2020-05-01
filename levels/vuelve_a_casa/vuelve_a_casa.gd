extends MinigameLogic

var ha_ganado = false

func _ready() -> void:
	pass
	
func _process(delta):
	if ha_ganado:
		have_won()
		ha_ganado = false
