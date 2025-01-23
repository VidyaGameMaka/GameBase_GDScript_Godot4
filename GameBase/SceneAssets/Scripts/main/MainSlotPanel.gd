extends Panel

@export var slotNum: int = 1

@export var myLabel: Label
@export var myStartBtn: Button
@export var myDeleteBtn: Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Connect button signals
	myStartBtn.connect("button_up", _startbtn_up)
	myDeleteBtn.connect("button_up", _deletebtn_up)
	#Update Label to show slot data
	_update_label()

func _update_label() -> void:
	myLabel.text = "slot: " + str(slotNum) + "\n"
	myLabel.text += "playedfile: " + str(GameMaster._playerDict[slotNum].playedFile) + "\n"
	myLabel.text += "savedScene: " + str(GameMaster._playerDict[slotNum].savedScene) + "\n"
	myLabel.text += "checkpoint: " + str(GameMaster._playerDict[slotNum].checkpoint) + "\n"


func _startbtn_up() -> void:
	GameMaster.LoadPlayerSlot(slotNum)
	GameMaster.playerData.playedFile = true
	call_deferred("_deferred_scene_change")

func _deletebtn_up() -> void:
	GameMaster.ErasePlayerDataSlot(slotNum)
	_update_label()


func _deferred_scene_change() -> void:
	var fullScenePath: String = GameMaster.sceneBasePath + GameMaster.playerData.savedScene + GameMaster.sceneExtension
	get_tree().change_scene_to_file(fullScenePath)
