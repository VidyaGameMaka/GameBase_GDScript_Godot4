extends Node

#Runtime vars
@export var playerData: PlayerData = PlayerData.new()
@export var gameData: GameData = GameData.new()
@export var achievementData: AchievementData = AchievementData.new()
@export var currentSlot: int = 0

@export var sceneBasePath: String = "res://Scenes/"
@export var sceneExtension: String = ".tscn"

@export var dontSaveScenes = ["main", "other"]

#Number of save slots to use
var _numSlots = 3;
#Dictionary to hold saved data existing in files
@export var _playerDict = { }

#Debugging
@export var debug_show_checkpoints: bool = true
@export var debug_show_exits: bool = true

#Private vars
var _save_file_path: String = "user://save/"
var _playerData_save_file_name: String = "PlayerData"
var _gameData_save_file_name: String = "GameData"
var _achievementData_save_file_name: String = "AchievementData"
var _save_file_suffix: String = ".tres"

func _ready() -> void:
	#Debugging toggle for release
	if OS.is_debug_build() == false:
		debug_show_checkpoints = false
		debug_show_exits = false
	
	#Verify that save file path exists
	DirAccess.make_dir_absolute(_save_file_path)
	
	#Print Data path for easier debugging
	print("Save Folder: " + ProjectSettings.globalize_path(_save_file_path))
	
	#Load playerData from files and place into _playerDict
	_SetupPlayerDataSlots()
	
	#Reset runtime playerData
	ResetPlayerDataRuntimeSlot()
	
	#Load gameData from file
	gameData = _LoadGameData().duplicate(true)
	
	#Load achievementData from file
	achievementData = _LoadAchievementData().duplicate(true)



##Public functions to be used in-game

#Save everything
func FullSave() -> void:
	#Save Game Data
	_SaveGameData()
	#Save Achievements
	_SaveAchievementData()
		
	var canSave: bool = true
	for scn in dontSaveScenes:
		if scn == playerData.savedScene:
			print("(GameMaster) Not Saving for Scene: " + scn)
			canSave = false
		
	#Save Player Data if not using slot 0
	if currentSlot == 0:
		print("currentslot is 0, not saving.")
		canSave = false
		
	if canSave == true:
		_SavePlayerData(currentSlot)
	


#Load a playerData from the dictionary into the runtime slot
func LoadPlayerSlot(slotNum: int) -> void:
	currentSlot = slotNum
	playerData = _playerDict[slotNum].duplicate(true)


#Delete a playerData slot. This should only be used on the main menu
#where the primary game is not running.
func ErasePlayerDataSlot(slotNum: int):
	#Reset Value in Dictionary
	_playerDict[slotNum] = PlayerData.new().duplicate(true)
	#Reset Runtime
	playerData = PlayerData.new().duplicate(true)
	#Save Default file
	_SavePlayerData(slotNum)


#Reload Data for the main menu
func ReloadPlayerDataMainMenu():
	playerData = PlayerData.new().duplicate(true)
	_SetupPlayerDataSlots()

## PlayerData functions

#Public function to load data into: GameMaster.playerData
func LoadRuntimeSlot(slotnum: int) -> void:
	currentSlot = slotnum
	playerData = _playerDict[slotnum].duplicate(true)


#Public function to set currentSlot to 0 and reset GameMaster.playerdata to default values
func ResetPlayerDataRuntimeSlot() -> void:
	currentSlot = 0;
	PlayerData.new().duplicate(true)


#Load slots from file and store them in a dictionary so we can use them later
func _SetupPlayerDataSlots() -> void:
	for n in range(1, _numSlots + 1):
		_playerDict[n] = _LoadPlayerData(n).duplicate(true)


#Load a single slot from file and return it
func _LoadPlayerData(slotNum: int) -> PlayerData:
	var fullPath = _save_file_path + _playerData_save_file_name + str(slotNum) + _save_file_suffix
	if (FileAccess.file_exists(fullPath)):
		return ResourceLoader.load(fullPath)
	else:
		playerData = PlayerData.new().duplicate(true)
		_SavePlayerData(slotNum)
		return PlayerData.new()


#Save GameMaster.playerData to the file specified
func _SavePlayerData(slotNum: int) -> void:
	var fullPath = _save_file_path + _playerData_save_file_name + str(slotNum) + _save_file_suffix
	ResourceSaver.save(playerData, fullPath)



## GameData functions

#GameData Load
func _LoadGameData() -> GameData:
	var fullPath = _save_file_path +_gameData_save_file_name + _save_file_suffix
	if (FileAccess.file_exists(fullPath)):
		return ResourceLoader.load(fullPath)
	else:
		gameData = GameData.new().duplicate(true)
		_SaveGameData()
		return GameData.new()


#GameData Save
func _SaveGameData() -> void:
	var fullPath = _save_file_path +_gameData_save_file_name + _save_file_suffix
	ResourceSaver.save(gameData, fullPath)



## AchievementData functions

#AchievementData Load
func _LoadAchievementData() -> AchievementData:
	var fullPath = _save_file_path + _achievementData_save_file_name + _save_file_suffix
	if (FileAccess.file_exists(fullPath)):
		return ResourceLoader.load(fullPath)
	else:
		achievementData = AchievementData.new().duplicate(true)
		_SaveAchievementData()
		return AchievementData.new()


#AchievementData Save
func _SaveAchievementData() -> void:
	var fullPath = _save_file_path + _achievementData_save_file_name + _save_file_suffix
	ResourceSaver.save(achievementData, fullPath)
