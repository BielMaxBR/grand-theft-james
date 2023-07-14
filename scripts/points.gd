extends Node

var pointList = []
var pointLoad = preload("res://scenes/Point.tscn")

func newPoint(node: Node2D, color = Color(1,1,1)):
	var new_point: Sprite2D = pointLoad.instantiate()
	new_point.remote_node = node
	new_point.modulate = color
	
	Global.minimap.add_child(new_point)
	pointList.append(new_point)
	return new_point

func removePoint(node):
	for point in pointList:
		if point.remote_node == node:
			pointList.erase(point)
			point.queue_free()
			return
