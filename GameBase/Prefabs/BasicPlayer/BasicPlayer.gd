extends CharacterBody2D

const SPEED = 300.0

func _ready() -> void:
	_warp_to_checkpoint()


func _warp_to_checkpoint() -> void:
	var checkpoints = get_tree().get_nodes_in_group("checkpoint")
	
	if (checkpoints.size() > 0):
		for item in checkpoints:
			if item.my_checkpoint == GameMaster.playerData.checkpoint:
				global_position = item.global_position + item.offset
	else:
		print("(player) No checkpoints found.")


func _physics_process(_delta: float) -> void:

	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()

	if abs(direction.x) > 0.1 or abs(direction.y) > 0.1:
		velocity = direction * SPEED
	else:
		velocity.x = 0
		velocity.y = 0

	move_and_slide()
