extends CharacterBody2D

var sommer = 0.3
func _physics_process(_delta):
	$Roda.rotation_degrees -= sommer
	if abs($Roda.rotation_degrees) > 50: sommer *= -1
	
	var dist = abs($Roda.position.y)
	
	$Ponto.position.x = dist * tan(-$Roda.rotation+PI/2)

	
	$"../Line2".set_point_position(0,$Roda.global_position)
	$"../Line2".set_point_position(1,$Ponto.global_position)
	$"../Line1".set_point_position(1,$Ponto.global_position)
	$"../Line1".set_point_position(0,global_position)

	var point: Vector2 = $Ponto.global_position
	rotation += (0.05 / $Ponto.position.x) * 200
	
	var point_v2 = $Ponto.global_position
	
	var diff = point_v2 - point
	global_position -= diff
