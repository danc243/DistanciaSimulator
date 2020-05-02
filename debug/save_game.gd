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
var _key_first_time_playing = "_key_first_time_playing"
var _key_se_busca  = "_key_se_busca"
var _key_quick_scopes = "_key_quick_scopes"

"""
Secciones de Guardado
"""
const _section_principal = "section_principal"


func set_george_lucas_state(state: int):
	config.set_value(_section_principal, _key_george_lucas_state, state)
	config.save(_save_path)

func get_george_lucas_state():
	return config.get_value(_section_principal, _key_george_lucas_state, 0)

func set_first_time_playing(state: bool):
	config.set_value(_section_principal, _key_first_time_playing, state)
	config.save(_save_path)

func get_first_time_playing():
	return config.get_value(_section_principal, _key_first_time_playing, true)

func set_se_busca_state(state: bool):
	config.set_value(_section_principal, _key_se_busca, state)
	config.save(_save_path)

func get_se_busca_state():
	return config.get_value(_section_principal, _key_se_busca, false)
	

func get_quick_scopes():
	return config.get_value(_section_principal, _key_quick_scopes, false)

func set_quick_scopes(state: bool):
	config.set_value(_section_principal, _key_first_time_playing, state)
