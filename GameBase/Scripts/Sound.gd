extends Node

#ASP = AudioStreamPlayer Nodes
var musicASP: AudioStreamPlayer
var voiceASP: AudioStreamPlayer
var maleASP: AudioStreamPlayer
var femaleASP: AudioStreamPlayer
var sfxPaths = ["SFX1", "SFX2", "SFX3", "SFX4", "SFX5", "SFX6", "SFX7", "SFX8", "SFX9", "SFX10", "SFX11", "SFX12", "SFX13", "SFX14", "SFX15", ]
var sfxASP: = []

#Track the path to the current song playing on music
var songPlayingPath: String = ""

#Audio Bus Indexes
var master_index = AudioServer.get_bus_index("Master")
var music_index = AudioServer.get_bus_index("Music")
var sfx_index = AudioServer.get_bus_index("SFX")
var voice_index = AudioServer.get_bus_index("Voice")
var male_index = AudioServer.get_bus_index("Male")
var female_index = AudioServer.get_bus_index("Female")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_SetBusVolumes()
	_SetPlayerNodePaths()


#Sets node paths for use
func _SetPlayerNodePaths() -> void:
	musicASP = get_node("Music")
	voiceASP = get_node("Voice")
	maleASP = get_node("Male")
	femaleASP = get_node("Female")
	#Populate sfxASP array with AudioStreamPlayers
	for pth in sfxPaths:
		sfxASP.push_back(get_node(pth))


# Set Volumes for each bus based on GameMaster.gameData
func _SetBusVolumes() -> void:
	AudioServer.set_bus_volume_db(master_index, linear_to_db(GameMaster.gameData.masterVolume))
	AudioServer.set_bus_volume_db(music_index, linear_to_db(GameMaster.gameData.musicVolume))
	AudioServer.set_bus_volume_db(sfx_index, linear_to_db(GameMaster.gameData.sfxVolume))
	AudioServer.set_bus_volume_db(voice_index, linear_to_db(GameMaster.gameData.voiceVolume))
	AudioServer.set_bus_volume_db(male_index, linear_to_db(GameMaster.gameData.maleVolume))
	AudioServer.set_bus_volume_db(female_index, linear_to_db(GameMaster.gameData.femaleVolume))


## Change Volume Funtions
# I made individual functions for each bus so that it is just a single function call

# Change Master Volume. Takes a value from 0 to 1
func ChangeMasterVolume(value: float) -> void:
	GameMaster.gameData.masterVolume = value
	AudioServer.set_bus_volume_db(master_index, linear_to_db(GameMaster.gameData.masterVolume))
	

# Change Music Volume. Takes a value from 0 to 1	
func ChangeMusicVolume(value: float) -> void:
	GameMaster.gameData.musicVolume = value
	AudioServer.set_bus_volume_db(music_index, linear_to_db(GameMaster.gameData.musicVolume))


# Change SFX Volume. Takes a value from 0 to 1
func ChangeSFXVolume(value: float) -> void:
	GameMaster.gameData.sfxVolume = value
	AudioServer.set_bus_volume_db(sfx_index, linear_to_db(GameMaster.gameData.sfxVolume))


# Change Voice Volume. Takes a value from 0 to 1
func ChangeVoiceVolume(value: float) -> void:
	GameMaster.gameData.voiceVolume = value
	AudioServer.set_bus_volume_db(voice_index, linear_to_db(GameMaster.gameData.voiceVolume))


# Change Male Volume. Takes a value from 0 to 1
func ChangeMaleVolume(value: float) -> void:
	GameMaster.gameData.maleVolume = value
	AudioServer.set_bus_volume_db(male_index, linear_to_db(GameMaster.gameData.maleVolume))


# Change Female Volume. Takes a value from 0 to 1
func ChangeFemaleVolume(value: float) -> void:
	GameMaster.gameData.femaleVolume = value
	AudioServer.set_bus_volume_db(female_index, linear_to_db(GameMaster.gameData.femaleVolume))


##Play Sound Functions
# Each bus has its own function to call to play a sound

#Play a sound on the SFX bus. As configured, you can play up to 15 sounds simultaneously
func PlaySFX(audioPath: String) -> void:
	for fx in sfxASP:
		if fx.playing == false:
			var mySound: AudioStream = load(audioPath)
			fx.stream = mySound
			fx.play()
			break;


#Play a sound on the Voice bus. There is only 1 AudioStreamPlayer so only 1 voice can play at a time.
func PlayVoice(audioPath: String) -> void:
	var mySound: AudioStream = load(audioPath)
	voiceASP.stream = mySound
	voiceASP.play()


#Play a sound on the Muisc bus. There is only 1 AudioStreamPlayer so only 1 song can play at a time.
func PlayMusic(audioPath: String) -> void:
	#Don't change song if it is the one currently playing
	if songPlayingPath != audioPath:
		songPlayingPath = audioPath
		var mySound: AudioStream = load(audioPath)
		musicASP.stream = mySound
		musicASP.play()


#Play a sound on the Male bus. There is only 1 AudioStreamPlayer so only 1 male voice can play at a time.
func PlayMale(audioPath: String) -> void:
	var mySound: AudioStream = load(audioPath)
	maleASP.stream = mySound
	maleASP.play()


#Play a sound on the Female bus. There is only 1 AudioStreamPlayer so only 1 female voice can play at a time.
func PlayFemale(audioPath: String) -> void:
	var mySound: AudioStream = load(audioPath)
	femaleASP.stream = mySound
	femaleASP.play()
