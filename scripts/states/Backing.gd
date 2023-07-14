extends PlayerState


func physics_update(_delta: float) -> void:
	player.actual_speed -= 1# - abs(player.actual_rotation_speed/2)
	player.actual_speed = clampf(
		player.actual_speed,
		player.min_speed,
		0)
	player.direction.y = -player.actual_speed # ele vai pra cima kk

	player.velocity = player.direction.rotated(player.rotation)  * player.acceleration

	if Input.is_action_just_released("down"):
		state_machine.transition_to("Slowing")
	if Input.is_action_pressed("up"):
		state_machine.transition_to("Accelerating")
	
#	if player.actual_speed == 0:
#		state_machine.transition_to("Idle")
