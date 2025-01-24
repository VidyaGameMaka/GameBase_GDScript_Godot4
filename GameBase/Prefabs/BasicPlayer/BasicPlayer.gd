extends CharacterBody2D

const SPEED = 300.0

#This is the simplest player controller possible for top-down movement. This player
#controller should be replaced by your player controller. The only thing you need to bring
#over to your controller is the _warp_to_checkpoint() function

func _ready() -> void:
	_warp_to_checkpoint()

#Move the player to the checkpoint that is specified in: GameMaster.playerData.checkpoint
func _warp_to_checkpoint() -> void:
	var checkpoints = get_tree().get_nodes_in_group("checkpoint")
	
	if (checkpoints.size() > 0):
		for item in checkpoints:
			if item.my_checkpoint == GameMaster.playerData.checkpoint:
				global_position = item.global_position + item.offset
	else:
		print("(player) No checkpoints found.")


#Very simple top-down player movement
func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	if abs(direction.x) > 0.1 or abs(direction.y) > 0.1:
		velocity = direction * SPEED
	else:
		velocity.x = 0
		velocity.y = 0
	move_and_slide()
