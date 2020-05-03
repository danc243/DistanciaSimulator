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
var _key_vuelve_casa = "_key_vuelve_casa"
var _key_quedate_en_casa = "_key_quedate_en_casa"
var _key_escapa = "_key_escapa"

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

func set_quick_scopes(state: bool):
	config.set_value(_section_principal, _key_quick_scopes, state)
	config.save(_save_path)

func get_quick_scopes():
	return config.get_value(_section_principal, _key_quick_scopes, false)

func set_vuelve_casa(state: bool):
	config.set_value(_section_principal, _key_vuelve_casa, state)
	config.save(_save_path)

func get_vueve_casa():
	return config.get_value(_section_principal, _key_vuelve_casa, false)

func set_quedate_en_casa(state: bool):
	config.set_value(_section_principal, _key_quedate_en_casa, state)
	config.save(_save_path)

func get_quedate_en_casa():
	return config.get_value(_section_principal, _key_quedate_en_casa, false)

func set_escapa(state: bool):
	config.set_value(_section_principal, _key_escapa, state)
	config.save(_save_path)

func get_escapa():
	return config.get_value(_section_principal, _key_escapa, false)
