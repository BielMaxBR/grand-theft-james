extends PlayerState


func physics_process(delta):
	if Input.is_action_just_released("up"):
		state_machine.transition_to("Slowing")
