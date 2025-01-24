# GameBase_GDScript_Godot4

This project was made in **Godot 4.3**. Older versions of Godot 4 are not recommended to use this project. This project is incompatible with Godot 3 and older.

GDScript version of my Save/Load/Delete system. This is a complete Godot project and is intended to be used as a starting point for a new game, however it is possible to copy it into your existing game, expect to perform some modifications to make it fit with your game's folder layout.

**This project includes the following features:**
* **Save/Load/Delete:**
	* Player Progress (playerData) (With three different save slots)

* **Save/Load Only**
 	* Game System Data (gameData) (Video & Audio Settings)
	* Achievements (AchievementData)

* **Other Features:**
	* Basic Sound System - Volume and Playback functions
		* Includes multiple busses setup: Master, SFX, Music, Voice, Male, Female
	* Basic Main Menu - Just add your own style!
	* Example Simple Player Controller and Checkpoint and Level Changing System

* **AutoLoad**
The following are required to be in your game's  
Project Settings->Globals->Autoload
* res://GameBase/AutoLoad/GameMaster.gd
* res://GameBase/AutoLoad/Sound.tscn