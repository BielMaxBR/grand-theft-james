extends Line2D

@export var lenght = 70
var point := Vector2()

@onready var real_position = position

func _physics_process(delta):
	global_position = Vector2.ZERO
	global_rotation = 0
	
	point = get_parent().global_position + (real_position).rotated(get_parent().rotation)

	add_point(point)
	while get_point_count() > lenght:
		remove_point(0)
