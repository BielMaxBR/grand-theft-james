extends Node2D

@export var pegavel = true

var point: Node2D
func _ready():
	randomize()
	$Pessoa.texture = load("res://sprites/pessoas/pessoa%s.jpg" % randi_range(1,12))
	$Timer.start()
	if pegavel:
		Global.pegavel.append(self)
	else:
		Global.impegavel.append(self)
		hide()

func _physics_process(delta):
	rotation = Global.player.rotation
	$Area2D/CollisionShape2D.disabled = not pegavel
	if not $AnimationPlayer.is_playing():
		visible = pegavel
	else:
		visible = true
	if point:
		point.visible = pegavel
func _on_area_2d_body_entered(body):
	if body.is_in_group("james"):
		print(name)
		$AnimationPlayer.play("pegado")
		pegavel = false
		Global.pegavel.erase(self)
		Global.impegavel.append(self)
		Points.removePoint(self)
		point = null
		Global.contagem += 1

func _on_timer_timeout():
	point = Points.newPoint(self, Color.LIME_GREEN)
