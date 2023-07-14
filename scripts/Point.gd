extends Sprite2D

@export var remote_node: Node2D

const MAP_HALF_SIZE = 95 / 0.06

func _physics_process(delta):
	var player_position = Global.player.global_position
	if remote_node:
		rotation = remote_node.rotation
		var distance = remote_node.global_position.distance_to(player_position)
		
		global_position = remote_node.global_position
		if Global.minimap_mode:
			if distance >= MAP_HALF_SIZE:
				global_position = player_position + player_position.direction_to(remote_node.global_position) * MAP_HALF_SIZE
