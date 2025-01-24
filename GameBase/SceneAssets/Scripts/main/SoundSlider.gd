extends HSlider

#enum of Bus names
enum audioBusses {Master, SFX, Music, Voice, Male, Female}
@export var myBus: audioBusses = audioBusses.Master

# Change the value of the slider depending on which bus is
# selected in the inspector
# Value for the slider ranges from 0 to 1 and is stepped 0.01
func _ready() -> void:
	match myBus:
		audioBusses.Master:
			value = GameMaster.gameData.masterVolume
		audioBusses.SFX:
			value = GameMaster.gameData.sfxVolume
		audioBusses.Music:
			value = GameMaster.gameData.musicVolume
		audioBusses.Voice:
			value = GameMaster.gameData.voiceVolume
		audioBusses.Male:
			value = GameMaster.gameData.maleVolume
		audioBusses.Female:
			value = GameMaster.gameData.femaleVolume
	_change_label(value)


#Update the label to show the name of the bus, and its value as a percentage
func _change_label(argvalue: float) -> void:
	var outnum: float = argvalue * 100
	$Label.text = audioBusses.keys()[myBus] + " " + str(outnum) + "%"


#Signal to react to the slider being changed
func _on_value_changed(argvalue: float) -> void:
	match myBus:
		audioBusses.Master:
			Sound.ChangeMasterVolume(argvalue)
		audioBusses.SFX:
			Sound.ChangeSFXVolume(argvalue)
		audioBusses.Music:
			Sound.ChangeMusicVolume(argvalue)
		audioBusses.Voice:
			Sound.ChangeVoiceVolume(argvalue)
		audioBusses.Male:
			Sound.ChangeMaleVolume(argvalue)
		audioBusses.Female:
			Sound.ChangeFemaleVolume(argvalue)
		
	_change_label(argvalue)
