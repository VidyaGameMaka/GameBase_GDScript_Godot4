extends Resource
class_name GameData

@export var teststr: String = "test"

#The default resolution and also the resolution the user selected
@export var resolutionIndex: int = 3

 #If true, run the game full screen
@export var isFullScreen: bool = false

#Windowed Resolution Presets, Only Come into Effect when ScreenMode is Windowed.
#Godot does not change the resolution of the monitor when it goes FullScreen, it uses the resolution as-is.
@export var windowResolutions = {
		1: Vector2i(480, 270),
		2: Vector2i(960, 540 ),
		3: Vector2i(1280, 720 ),
		4: Vector2i(1920, 1080),
		5: Vector2i(2560, 1440),
		6: Vector2i(3840, 2160),
	}


#Audio Volumes
@export var masterVolume: float = 1
@export var sfxVolume: float = 1
@export var musicVolume: float = 0.40
@export var voiceVolume: float = 1
@export var maleVolume: float = 1
@export var femaleVolume: float = 1

#Default Audio Volumes
const default_masterMaxVolume: float = 1
const default_musicMaxVolume: float = 0.40
const default_soundfxMaxVolume: float = 1
const default_voiceMaxVolume: float = 1
const default_femaleMaxVolume: float = 1
const default_maleMaxVolume: float = 1

#Translation System
enum Languages {english, spanish, french}
@export var languageChosen: bool = false
@export var language: Languages = Languages.english
