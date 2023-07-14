extends PlayerState


func physics_update(_delta: float) -> void:
	player.actual_speed *= .99
	if abs(player.actual_speed) < 5:
		player.actual_speed = 0
	
	player.direction.y = -player.actual_speed # ele vai pra cima kk
	
	player.velocity = player.direction.rotated(player.rotation)  * player.acceleration

	if Input.is_action_pressed("up"):
		state_machine.transition_to("Accelerating")
	elif Input.is_action_pressed("down"):
		state_machine.transition_to("Breaking")
	if player.velocity.rotated(player.rotation).y == 0:
		state_machine.transition_to("Idle")
