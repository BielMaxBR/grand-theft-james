extends Node2D

func _ready():
	Global.setMinimap($CanvasLayer/Control/points/map)
	Global.setRoot(self)
	$CanvasLayer/Control/cont/vew.world_2d = get_viewport().world_2d
	$Game_timer.wait_time = 60*3
	$Contagem.start()

func _process(delta):
	if Input.is_action_just_pressed("map"):
		Global.minimap_mode = not Global.minimap_mode

	$CanvasLayer/Control/cont/vew.size = Vector2(200,200) if Global.minimap_mode else Vector2(700,640)
	$CanvasLayer/Control/points/map.size = Vector2(200,200) if Global.minimap_mode else Vector2(700,640)
	$CanvasLayer/Control/cont.material.set_shader_parameter("minimap_mode", Global.minimap_mode)

	$CanvasLayer/Control/Contadores/Game_time.text = "tempo: %s" % time_convert($Game_timer.time_left)
	$CanvasLayer/Control/Contagem.text = "COMEÇANDO EM: %.0d" % ($Contagem.time_left + 1)
	
	$CanvasLayer/Control/Contadores/Entregado.text = "Saladas: %s" % Global.contagem
#	if len(Global.levels[Global.actual_level]) == 0:
#		print("ganhaste")

func _on_contagem_timeout():
	$Game_timer.start()
	$CanvasLayer/Control/Contagem.hide()
	$CanvasLayer/Control/Contadores.show()
	$James.travado = false

func _on_game_timer_timeout():
	$CanvasLayer/Control/Ganhado.show()
	$CanvasLayer/Control/Contadores.hide()
	$James.travado = true

func time_convert(time_in_sec):
	var seconds = int(time_in_sec)%60
	var minutes = (int(time_in_sec)/60)%60

	#returns a string with the format "HH:MM:SS"
	return "%02d:%02d" % [minutes, seconds]


func _on_button_pressed():
	get_tree().reload_current_scene()
