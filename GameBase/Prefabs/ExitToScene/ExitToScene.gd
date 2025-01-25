@tool
extends Area2D

@export var my_checkpoint: int = 0
##Filename only. No folder or extension.
@export var my_scene_path: String = ""

func _ready() -> void:
	#Hide Label and Sprite is debuggins is false
	if GameMaster.debug_show_exits == false:
		$Sprite2D.visible = false
		$Label.visible = false


func _process(_delta: float) -> void:
	$Label.text = my_scene_path + "\n" + str(my_checkpoint)


func _on_body_entered(body: Node2D) -> void:
	if (body.is_in_group("player")):
		print("player body entered exit: " + str(my_checkpoint) + " " + my_scene_path)
		call_deferred("_deferred_scene_change")


func _deferred_scene_change() -> void:
	GameMaster.playerData.checkpoint = my_checkpoint
	GameMaster.playerData.savedScene = my_scene_path
	GameMaster.FullSave()
	#If going to main, reload the saved data
	if my_scene_path == "main":
		GameMaster.ReloadPlayerDataMainMenu()
	#Determine scene to go to, then change scene
	var fullScenePath: String = GameMaster.sceneBasePath + my_scene_path + GameMaster.sceneExtension
	get_tree().change_scene_to_file(fullScenePath)
