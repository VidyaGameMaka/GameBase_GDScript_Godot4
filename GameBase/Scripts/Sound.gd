extends Node

#ASP = AudioStreamPlayer Nodes
var musicASP: AudioStreamPlayer
var voiceASP: AudioStreamPlayer
var maleASP: AudioStreamPlayer
var femaleASP: AudioStreamPlayer
var sfxPaths = ["SFX1", "SFX2", "SFX3", "SFX4", "SFX5", "SFX6", "SFX7", "SFX8", "SFX9", "SFX10", "SFX11", "SFX12", "SFX13", "SFX14", "SFX15", ]
var sfxASP = []

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


func ChangeMasterVolume(value: float) -> void:
	GameMaster.gameData.masterVolume = value
	AudioServer.set_bus_volume_db(master_index, linear_to_db(GameMaster.gameData.masterVolume))
	
	
func ChangeMusicVolume(value: float) -> void:
	GameMaster.gameData.musicVolume = value
	AudioServer.set_bus_volume_db(music_index, linear_to_db(GameMaster.gameData.musicVolume))


func ChangeSFXVolume(value: float) -> void:
	GameMaster.gameData.sfxVolume = value
	AudioServer.set_bus_volume_db(sfx_index, linear_to_db(GameMaster.gameData.sfxVolume))


func ChangeVoiceVolume(value: float) -> void:
	GameMaster.gameData.voiceVolume = value
	AudioServer.set_bus_volume_db(voice_index, linear_to_db(GameMaster.gameData.voiceVolume))


func ChangeMaleVolume(value: float) -> void:
	GameMaster.gameData.maleVolume = value
	AudioServer.set_bus_volume_db(male_index, linear_to_db(GameMaster.gameData.maleVolume))


func ChangeFemaleVolume(value: float) -> void:
	GameMaster.gameData.femaleVolume = value
	AudioServer.set_bus_volume_db(female_index, linear_to_db(GameMaster.gameData.femaleVolume))


func PlaySFX(audioPath: String) -> void:
	for fx in sfxASP:
		if fx.playing == false:
			var mySound: AudioStream = load(audioPath)
			fx.stream = mySound
			fx.play()
			break;


func PlayVoice(audioPath: String) -> void:
	var mySound: AudioStream = load(audioPath)
	voiceASP.stream = mySound
	voiceASP.play()


func PlayMusic(audioPath: String) -> void:
	var mySound: AudioStream = load(audioPath)
	musicASP.stream = mySound
	musicASP.play()


func PlayMale(audioPath: String) -> void:
	var mySound: AudioStream = load(audioPath)
	maleASP.stream = mySound
	maleASP.play()


func PlayFemale(audioPath: String) -> void:
	var mySound: AudioStream = load(audioPath)
	femaleASP.stream = mySound
	femaleASP.play()
