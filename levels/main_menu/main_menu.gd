extends Control

class_name MainMenu

onready var bee_movie_button = $"buttons/Mensaje Bee Movie"
onready var buttons = $buttons
onready var nodeHandler = $handler
onready var laPrecuelaBeeMovieHandler = $LaPrecuelaBeeMovie
onready var txtLabel = $LaPrecuelaBeeMovie/ColorRect/TxtLabel

onready var se_busca_button = $"buttons/Se Busca"
onready var se_busca_txt = $"Se Busca"

onready var quickes_copes_txt = $QuickesCopes
onready var quickes_copes_button =$"buttons/Qüickes Copes"

onready var vuelve_casa_button = $"buttons/Vuelve a casa"
onready var vuelve_casa_txt = $"Vuelve a casa"

var window_game = null

func _ready():
	var savegame = get_node("/root/SaveGame")
	bee_movie_button.visible = savegame.get_george_lucas_state() > 0
	se_busca_button.visible = savegame.get_se_busca_state()
	quickes_copes_button.visible = savegame.get_quick_scopes()
	vuelve_casa_button.visible = savegame.get_vueve_casa()

func _on_Game_Icon_on_pressed_button():
	if nodeHandler.get_child_count() > 0:
		print("El juego ya está activo")
	else:
		var node = load("res://actors/window_game/window_game.tscn") 
		window_game = node.instance()
		window_game.init(self)
		var ventana = get_tree().get_root().get_node("Control").get_node("handler")
		ventana.add_child(window_game)
		_setButtons(MOUSE_FILTER_IGNORE)

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("escape") && window_game!=null):
		window_game.queue_free()
		window_game = null
		_setButtons(MOUSE_FILTER_STOP)

func close_the_game():
	window_game.queue_free()
	window_game = null
	_setButtons(MOUSE_FILTER_STOP)

func _setButtons(mouseFilter):
	var children = buttons.get_children()
	for child in children:
		if child is Button:
			child.mouse_filter = mouseFilter


func _on_Mensaje_on_pressed_button():
	laPrecuelaBeeMovieHandler.visible = true
	_setButtons(MOUSE_FILTER_IGNORE)
	if laPrecuelaBeeMovieHandler.txt.text.empty():
		var f = File.new()
		f.open("res://assets/george_lucas/La_Precuela_Perdida.txt", File.READ)
		txtLabel.text = f.get_as_text()
		f.close()

func _on_LaPrecuelaBeeMovie_close_window():
	laPrecuelaBeeMovieHandler.visible = false
	_setButtons(MOUSE_FILTER_STOP)

func _on_Se_Busca_on_pressed_button():
	_setButtons(MOUSE_FILTER_IGNORE)
	se_busca_txt.visible = true

func _on_Se_Busca_close_window():
	_setButtons(MOUSE_FILTER_STOP)
	se_busca_txt.visible = false


func _on_QuickesCopes_close_window():
	_setButtons(MOUSE_FILTER_STOP)
	quickes_copes_txt.visible = false

func _on_Qickes_Copes_on_pressed_button():
	quickes_copes_txt.visible = true
	_setButtons(MOUSE_FILTER_IGNORE)

func _on_Vuelve_a_casa_on_pressed_button():
	_setButtons(MOUSE_FILTER_IGNORE)
	vuelve_casa_txt.visible = true

func _on_Vuelve_a_casa_close_window():
	_setButtons(MOUSE_FILTER_STOP)
	vuelve_casa_txt.visible = false
