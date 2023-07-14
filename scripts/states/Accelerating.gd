extends PlayerState


func physics_update(_delta: float) -> void:
	player.actual_speed += 1# - abs(player.actual_rotation_speed/2)
	player.actual_speed = clampf(
		player.actual_speed,
		player.min_speed,
		player.max_speed * (1 - (abs(player.actual_rotation_speed) / player.max_rotation) * .25))
	player.direction.y = -player.actual_speed # ele vai pra cima kk

	player.velocity = player.direction.rotated(player.rotation)  * player.acceleration

	
	if Input.is_action_just_released("up"):
		state_machine.transition_to("Slowing")
	if Input.is_action_pressed("down"):
		state_machine.transition_to("Breaking")
	
		
