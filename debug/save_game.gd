extends Node

"""
	var savegame = get_node("/root/SaveGame")
	var state = savegame.get_george_lucas_state()

	var state = savegame.get_george_lucas_state()
	state += 1
	savegame.set_george_lucas_state(state)
"""

var _save_path = "res://debug/save-game.cfg"
var config = ConfigFile.new()
var load_response = config.load(_save_path)

var _key_george_lucas_state = "_key_george_lucas_state"

"""
Secciones de Guardado
"""
const _section_principal = "section_principal"


func set_george_lucas_state(state: int):
	config.set_value(_section_principal, _key_george_lucas_state, state)
	config.save(_save_path)

func get_george_lucas_state():
	return config.get_value(_section_principal, _key_george_lucas_state, 0)
