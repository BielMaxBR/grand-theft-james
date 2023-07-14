extends PlayerState


func enter(_msg := {}) -> void:
	player.velocity = Vector2.ZERO


func physics_update(_delta: float) -> void:
	if Input.is_action_just_pressed("up"):
		state_machine.transition_to("Accelerating")
		
	if Input.is_action_just_pressed("down"):
		state_machine.transition_to("Backing")
		
