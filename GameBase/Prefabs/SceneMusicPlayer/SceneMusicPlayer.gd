extends Node2D

enum sceneMusicLevels {main, level_one, level_two}
@export var mySong: sceneMusicLevels

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match mySong:
		sceneMusicLevels.main:
			Sound.PlayMusic("res://Audio/Music/KevenMcLeold_SneakySnitch.mp3")
		sceneMusicLevels.level_one:
			Sound.PlayMusic("res://Audio/Music/KevinMcLeold_CloudDancer.mp3")
		sceneMusicLevels.level_two:
			Sound.PlayMusic("res://Audio/Music/Scheming_Weasel_faster_KevinMcLeold_incompetch.mp3")
