extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_populate_option_button()
	_hide_show_option_button()
	_window_optionbutton_text()

#Add items to the option button
func _populate_option_button() -> void:
	#Add Resolution to top of list that is the current value in gameData
	var myTopLabel = str(GameMaster.gameData.windowResolutions[GameMaster.gameData.resolutionIndex][0]) + "x" + str(GameMaster.gameData.windowResolutions[GameMaster.gameData.resolutionIndex][1])
	$OptionButton.add_item(myTopLabel, GameMaster.gameData.resolutionIndex)
	
	#Add the full list of windowResolutions to the option button
	for key in GameMaster.gameData.windowResolutions.keys():
		var myItemLabel = str(GameMaster.gameData.windowResolutions[key][0]) + "x" + str(GameMaster.gameData.windowResolutions[key][1])
		$OptionButton.add_item(myItemLabel, key)


#Hide OptionButton if Game is Full Screen
func _hide_show_option_button() -> void:
	if (GameMaster.gameData.isFullScreen):
		$OptionButton.visible = false
	else:
		$OptionButton.visible = true


#Change text of the button depending if the game is full screen or not
func _window_optionbutton_text() -> void:
	if GameMaster.gameData.isFullScreen == true:
		$windowModeButton.text = "Full Screen"
	else:
		$windowModeButton.text = "Window"


#Signal for the window button being clicked
func _on_window_mode_button_button_up() -> void:
	#Toggle Window Mode
	GameMaster.gameData.isFullScreen = !GameMaster.gameData.isFullScreen
	_window_optionbutton_text()
	_hide_show_option_button()
	GameMaster.ApplyVideoSettings()


#Signal to react to the option button selection changing
func _on_option_button_item_selected(_index: int) -> void:
	#Get the ID from the optionbutton item not the index sent from the signal
	var selectedIndex = $OptionButton.get_selected_id()
	GameMaster.gameData.resolutionIndex = selectedIndex
	GameMaster.ApplyVideoSettings()
