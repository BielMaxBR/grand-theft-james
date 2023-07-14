extends CharacterBody2D
class_name Player

@export_subgroup("speeds")
@export var max_speed = 200
@export var min_speed = -50
@export_subgroup("")
@export var remote_path: NodePath

var actual_speed = 0
var acceleration = 3.2

var max_rotation = 2
var actual_rotation_speed = 0

var direction = Vector2.ZERO

var travado = true

func _init():
	Global.setPlayer(self)
	
func _ready():
	if remote_path:
		var remote = RemoteTransform2D.new()
		remote.remote_path = get_node(remote_path).get_path()
		add_child(remote)

func _physics_process(delta):
	rodar_roda()
	rodar_james()
	if not travado:
		move_and_slide()
func rodar_roda():
	var input_rotation = Input.get_axis("left","right")
	
	actual_rotation_speed += input_rotation / 10
	
	if sign(input_rotation) != sign(actual_rotation_speed):
		if abs(actual_rotation_speed) > 0.05:
			actual_rotation_speed *= 0.9
		else:
			actual_rotation_speed = 0
		
	
	actual_rotation_speed = clampf(actual_rotation_speed, -max_rotation, max_rotation)
	$Roda.rotation_degrees += actual_rotation_speed
	var a = inverse_lerp(0,max_speed, actual_speed)
	var max_degrees =  45 * (1-a)

	$Roda.rotation_degrees = clampf($Roda.rotation_degrees,-max_degrees,max_degrees)
	
	if sign(input_rotation) != sign(actual_rotation_speed):
		$Roda.rotation_degrees *= 0.9
		if abs($Roda.rotation_degrees) < 1:
			$Roda.rotation_degrees = 0


func rodar_james():
	if abs($Roda.rotation_degrees) < 2: return
	var dist = $Roda.position.distance_to($Traseira.position)

	$PivotPoint.position.y = $Traseira.position.y
	$PivotPoint.position.x = dist * tan(-$Roda.rotation-PI/2)
	var point: Vector2 = $PivotPoint.global_position
	rotation += (0.05 / $PivotPoint.position.x) * actual_speed

	var point_v2 = $PivotPoint.global_position

	var diff = point_v2 - point
	direction.x = diff.rotated(rotation).x

func _on_state_machine_transitioned(state_name):
	$StateName.text = state_name
