extends PlayerState


func physics_update(_delta: float) -> void:
	player.actual_speed *= .95
	if player.actual_speed < 5:
		player.actual_speed = 0
	
	player.direction.y = -player.actual_speed # ele vai pra cima kk
	
	player.velocity = player.direction.rotated(player.rotation)  * player.acceleration

	if Input.is_action_just_released("down"):
		state_machine.transition_to("Slowing")
		return
	if player.actual_speed == 0:
		state_machine.transition_to("Idle")
