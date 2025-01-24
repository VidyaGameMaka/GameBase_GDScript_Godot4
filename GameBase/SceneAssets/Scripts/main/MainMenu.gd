extends CanvasLayer

func _ready() -> void:
	_hide_all_menus()
	$MainMenu_Control.visible = true

func _hide_all_menus() -> void:
	$MainMenu_Control.visible = false
	$StartGame_Control.visible = false
	$Sound_Control.visible = false


func _on_back_button_button_up() -> void:
	_hide_all_menus()
	$MainMenu_Control.visible = true


func _on_start_game_button_button_up() -> void:
	_hide_all_menus()
	$StartGame_Control.visible = true


func _on_sound_button_button_up() -> void:
	_hide_all_menus()
	$Sound_Control.visible = true


func _on_quit_button_button_up() -> void:
	get_tree().quit()
