extends Button


func _on_button_up() -> void:
	#Reset All Sound Volumes
	Sound.ResetAllSoundVolumes()
	#Change Slider Values
	$"../master_HSlider".value = GameMaster.gameData.masterVolume
	$"../sfx_HSlider".value = GameMaster.gameData.sfxVolume
	$"../music_HSlider".value = GameMaster.gameData.musicVolume
	$"../voice_HSlider".value = GameMaster.gameData.voiceVolume
	$"../male_HSlider".value = GameMaster.gameData.maleVolume
	$"../female_HSlider".value = GameMaster.gameData.femaleVolume
