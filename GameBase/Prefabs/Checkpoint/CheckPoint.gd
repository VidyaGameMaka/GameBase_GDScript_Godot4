@tool
extends Area2D

@export var my_checkpoint = 0
@export var offset: Vector2 = Vector2(32,32)

func _ready() -> void:
	#Hide label and Sprite if debugging is false
	if GameMaster.debug_show_checkpoints == false:
		$Label.visible = false
		$Sprite2D.visible = false


func _process(_delta: float) -> void:
	$Label.text = str(my_checkpoint)


func _on_body_entered(body: Node2D) -> void:
		if (body.is_in_group("player")):
			print("player body entered checkpoint: " + str(my_checkpoint))
			GameMaster.playerData.checkpoint = my_checkpoint
			GameMaster.FullSave()
