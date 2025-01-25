extends CanvasLayer

#Hide all other Top-Level Control nodes and show the Main Menu
func _ready() -> void:
	_on_back_button_button_up()


#Hide all Top-Level Control nodes
func _hide_all_menus() -> void:
	$MainMenu_Control.visible = false
	$StartGame_Control.visible = false
	$Sound_Control.visible = false
	$VideoMenu_Control.visible = false


#Save Game Data. Hide all other Top-Level Control nodes and show the Main Menu
func _on_back_button_button_up() -> void:
	GameMaster._SaveGameData()
	_hide_all_menus()
	$MainMenu_Control.visible = true
	#Grab focus of first button so keyboard/gamepad inputs work
	$MainMenu_Control/HFlowContainer/StartGameButton.grab_focus()


#Hide other nodes and Show the Start Game Menu
func _on_start_game_button_button_up() -> void:
	_hide_all_menus()
	$StartGame_Control.visible = true
	#Grab focus of first button so keyboard/gamepad inputs work
	$StartGame_Control/Slot_Panel1/StartGameButton1.grab_focus()


#Hide other nodes and Show the Sound Menu
func _on_sound_button_button_up() -> void:
	_hide_all_menus()
	$Sound_Control.visible = true
	#Grab focus of first button so keyboard/gamepad inputs work
	$Sound_Control/master_HSlider.grab_focus()


#Hide other nodes and Show the Video Menu
func _on_video_button_button_up() -> void:
	_hide_all_menus()
	$VideoMenu_Control.visible = true
	#Grab focus of first button so keyboard/gamepad inputs work
	$VideoMenu_Control/windowModeButton.grab_focus()


#Save Game Data then Quit and Close the Game
func _on_quit_button_button_up() -> void:
	GameMaster.QuitGame()
